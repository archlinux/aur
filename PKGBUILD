# Maintainer: oioi555 <oioi555x@gmail.com>
# AUR package: unpacks the GitHub Release .deb.
# Local source builds use ../PKGBUILD (openquotacycle-git), not this file.

pkgname=openquotacycle-bin
pkgver=0.2.0
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
source=("https://github.com/oioi555/openquotacycle/releases/download/v0.2.0/OpenQuotaCycle_0.2.0_amd64.deb")
sha256sums=('e2eea016710e496e6d1a0f59d94d4453f912e61adb8f9385028682d9b7419cf7')
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
