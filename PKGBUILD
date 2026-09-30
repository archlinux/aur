# Maintainer: oioi555 <oioi555x@gmail.com>
# AUR package: unpacks the GitHub Release .deb.
# Local source builds use ../PKGBUILD (openquotacycle-git), not this file.

pkgname=openquotacycle-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Linux desktop app for planning AI coding quotas around the 5-hour window"
arch=('x86_64')
url="https://github.com/oioi555/openquotacycle"
license=('MIT')
provides=('openquotacycle')
conflicts=('openquotacycle' 'quotracker' 'quotracker-bin' 'quotracker-git')
replaces=('quotracker' 'quotracker-bin' 'quotracker-git')
depends=('webkit2gtk-4.1' 'gtk3')
options=('!strip' '!debug')
source=("https://github.com/oioi555/openquotacycle/releases/download/v0.3.0/OpenQuotaCycle_0.3.0_amd64.deb")
sha256sums=('e92b262db27e8da34e0b0b9c8e4545d26c8e42a4bb86be8e603a7acd39c19312')
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
