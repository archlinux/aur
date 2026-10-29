# Maintainer: xTom <packages@xtom.com>
# Maintainer: Xiufeng Guo <i@m.ac>
pkgname=rdap-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="RDAP (Registration Data Access Protocol) client and API server - prebuilt binary"
arch=('x86_64' 'aarch64')
url="https://github.com/xtomcom/rdap"
license=('MIT')
depends=('gcc-libs')
provides=('rdap')
conflicts=('rdap')
backup=('etc/default/rdap')
options=('!strip' '!debug')
source_x86_64=("$pkgname-$pkgver-x86_64.deb::$url/releases/download/v$pkgver/rdap_${pkgver}_amd64.deb")
source_aarch64=("$pkgname-$pkgver-aarch64.deb::$url/releases/download/v$pkgver/rdap_${pkgver}_arm64.deb")
sha256sums_x86_64=('40a5d932c77f33f85966c4eb0b3ec2e62c0571eddaa115bda99524d79678798d')
sha256sums_aarch64=('44c303592a2f4531f4b28ef0244efc12e08b9700741de4d08f7db35ed52e5959')

package() {
    cd "$srcdir"

    # Extract deb package
    bsdtar -xf data.tar.*

    # Install files
    install -Dm755 usr/bin/rdap "$pkgdir/usr/bin/rdap"
    install -Dm644 usr/lib/systemd/system/rdap.service "$pkgdir/usr/lib/systemd/system/rdap.service"
    install -Dm600 etc/default/rdap "$pkgdir/etc/default/rdap"
}
