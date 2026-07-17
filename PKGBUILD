# Maintainer: kstover-dev <dev at kstover dot net>
#
pkgname=breezewiki-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="An alternative frontend for Fandom"
arch=("x86_64")
url="https://breezewiki.com"
license=("AGPLv3")
options=('!debug')
source=(
    "https://docs.breezewiki.com/files/breezewiki-dist.tar.gz"
    "breezewiki.service"
    "breezewiki.sh"
    "config.ini"
)
sha256sums=(
    "f1b9bc650a02a4c36c09574620a513c89707a3b7a4db38daf6e2673238593688"
    "8d45dc2f15933fad713351eb359f5927c9ff1752f248f6a79fd1697b693bc85d"
    "613d5fccd3fa60800b20f5c88c64ec6e3f1d714425b3c2355b8e113d5920b375"
    "4f1d1625c8fa4a41f8d73744288ac099dc90de08cd28386785e36588723dfa29"
)
package() {
    mkdir -pm0755 "${pkgdir}/opt"
    mkdir -pm0755 "${pkgdir}/etc"
    mkdir -pm0755 "${pkgdir}/usr/bin"
    mkdir -pm0755 "${pkgdir}/usr/lib/systemd/system"

    cp -r "${srcdir}/breezewiki-dist" "${pkgdir}/opt/breezewiki-bin"
    cp "${srcdir}/config.ini" "${pkgdir}/etc/breezewiki.ini"
    cp "${srcdir}/breezewiki.sh" "${pkgdir}/usr/bin/breezewiki"
    cp "${srcdir}/breezewiki.service" "${pkgdir}/usr/lib/systemd/system/breezewiki-bin.service"
    ln -sf "/etc/breezewiki.ini" "$(find "${pkgdir}/opt/breezewiki-bin/lib" -name config.ini)"
}

