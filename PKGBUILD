# Maintainer: oioi555 <oioi555x@gmail.com>
# AUR package: unpacks the GitHub Release .deb.
# Local source builds use ../PKGBUILD (quotracker-git), not this file.

pkgname=quotracker-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Linux desktop app for planning AI coding quotas around the 5-hour window"
arch=('x86_64')
url="https://github.com/oioi555/quotracker"
license=('MIT')
provides=('quotracker')
conflicts=('quotracker')
depends=('webkit2gtk-4.1' 'gtk3')
options=('!strip' '!debug')
source=("https://github.com/oioi555/quotracker/releases/download/v0.1.1/Quotracker_0.1.1_amd64.deb")
sha256sums=('339311d9a17b08428a2968767960a7a4fe1aed23887ae44a6ca914777058e622')
noextract=("${source[0]##*/}")

package() {
    local data_archive
    bsdtar -xf "${srcdir}"/*.deb
    data_archive="$(printf '%s\n' data.tar.* | head -n 1)"
    if [[ ! -f "${data_archive}" ]]; then
        echo "data.tar archive not found in .deb" >&2
        return 1
    fi
    bsdtar -xf "${data_archive}" -C "${pkgdir}"
}
