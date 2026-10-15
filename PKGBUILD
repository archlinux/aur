# Maintainer: czyt <czytcn@gmail.com>
pkgname=astrlink-bin
pkgver=0.2.10
pkgrel=1
pkgdesc="A local privacy gateway for AI agents"
arch=('x86_64')
url="https://astrlink.com"
license=('Apache-2.0' 'AGPL-3.0-only')
depends=('gtk3' 'webkit2gtk-4.1' 'libsoup3' 'dbus' 'libayatana-appindicator' 'gcc-libs')
provides=('astrlink')
conflicts=('astrlink')
options=('!strip' '!debug')

source_x86_64=("AstrLink_${pkgver}_amd64.deb::https://github.com/Calcium-Ion/AstrLink/releases/download/v${pkgver}/AstrLink_${pkgver}_amd64.deb")
sha256sums_x86_64=('63dd77fe2ad265e419a54488f6dcd94a7215c75925ca85a3c41060e02edf4e0d')
noextract=("AstrLink_${pkgver}_amd64.deb")

package() {
    local _deb="AstrLink_${pkgver}_amd64.deb"

    bsdtar -xOf "${srcdir}/${_deb}" data.tar.gz |
        bsdtar --no-same-owner -xf - -C "${pkgdir}"

    # Upstream ships the 256x256 icon under "256x256@2", which the hicolor
    # theme does not pick up.
    mv "${pkgdir}/usr/share/icons/hicolor/256x256@2" \
        "${pkgdir}/usr/share/icons/hicolor/256x256"
}
