# Maintainer: Yassine <cherradiyacyn@icloud.com>
pkgname=mlink-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="The background link program/driver for Makeblock mBlock robot communication"
arch=('x86_64')
url="https://www.mblock.cc"
license=('custom')
depends=('glibc' 'gcc-libs' 'bash')
provides=('mlink')
conflicts=('mlink')
install=mlink.install
options=('!strip')

source=("mlink-${pkgver}.deb::https://github.com/cherradiyacyn/mlink-arch/releases/download/v1.2.0/mLink-1.2.0-amd64.deb"
        "mlink.service")
sha256sums=('28bc63f356636c4be185acf4b1e341e165d7e726de67bfd6713d5d19f75695ed'
            'f7b301ac2c2fef280e6444cf74ffdff1a2ace509091324f263e8e220d0bf3e66')

package() {
    install -d "${pkgdir}/opt/makeblock"
    install -d "${pkgdir}/usr/bin"

    tar -xf "${srcdir}/data.tar.xz" -C "${srcdir}"

    cp -r "${srcdir}/usr/local/makeblock/mLink" "${pkgdir}/opt/makeblock/mlink"

    sed -i 's|appDir="/usr/local/makeblock/mLink"|appDir="/opt/makeblock/mlink"|g' "${pkgdir}/opt/makeblock/mlink/mlink"

    ln -s /opt/makeblock/mlink/mlink "${pkgdir}/usr/bin/mlink"

    install -Dm644 "${srcdir}/mlink.service" "${pkgdir}/usr/lib/systemd/system/mlink.service"
}
