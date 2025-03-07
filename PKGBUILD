# Maintainer: taotieren <admin@taotieren.com>

pkgbase=wyc
pkgname=wyc
pkgver=2.65.4
pkgrel=1
pkgdesc="网云穿最便捷的端口映射"
license=('LicenseRef-scancode-commercial-license')
url="https://xiaomy.net/"
arch=($CARCH)
options=(!strip !debug)
depends=()
makedepends=(libarchive)
provides=(${pkgname} ${pkgname}-bin)
conflicts=(${pkgname} ${pkgname}-bin)
replaces=()
backup=(etc/wyc.conf)
install=${pkgname}.install
source=(
    "wyc.service"
    "wyc.conf"
    "${pkgname}.install"
    "LICENSE::https://xiaomy.net/agreement"
    "${pkgname}-x86_64-${pkgver}::https://down.xiaomy.net/linux/wyc_linux_64"
    "${pkgname}-aarch64-${pkgver}::https://down.xiaomy.net/linux/wyc_linux_arm"
)
sha256sums=('6a96d16df3b661afb33d294ac51573ee9688b7ed0b11eeeafca5d8d320c84de5'
            '07469b0f8874586cdb3972b1d4f82d59579c6dfd17f9b99bd3f7526998329835'
            '3c4681a337aaa2ff6d1e406d5feb61610dddf58477b7e338881957b8b7cc7b51'
            'ca9e6e9fb214e74ac908ce8b5a37880006c337d6a5fb5b9c550c1019b348791b'
            'c299049774e59ee7a12645a461f571ace0f1b09dcca1b2707a49475ef0d18694'
            'f161bc9c3d2cf3a7b12ba2c8b6a981e33cb2bd87b1b816b83cc14190c82290fa')
noextract=()

package() {
    if [ "$CARCH" == "aarch64" ]; then
        msg2 "Install for arm64"
        install -vDm755 ${srcdir}/${pkgname}-${CARCH}-${pkgver} ${pkgdir}/usr/bin/${pkgname}
    elif [ "$CARCH" == "x86_64" ]; then
        msg2 "Install for x64"
        install -vDm755 ${srcdir}/${pkgname}-${CARCH}-${pkgver} ${pkgdir}/usr/bin/${pkgname}
    else
        msg2 "Unsupported architectures"
    fi

    install -vDm644 ${srcdir}/wyc.service -t ${pkgdir}/usr/lib/systemd/system/
    install -vDm644 ${srcdir}/wyc.conf -t ${pkgdir}/etc/
    install -vDm644 ${srcdir}/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
