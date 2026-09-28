# Maintainer: Ashley Piller <ashley@purrr.chat>
# Prebuilt native desktop client for purrr. Ships the fertigen Binary aus dem
# Forgejo-Release — kein lokaler Build, kein offener Quellcode nötig.
pkgname=purrr-client-bin
_pkgname=purrr
pkgver=0.1.6
pkgrel=1
pkgdesc="Native desktop client for purrr, a cozy self-hosted Discord alternative (prebuilt binary)"
arch=('x86_64')
url="https://purrr.chat"
license=('AGPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
provides=('purrr-client')
conflicts=('purrr-client' 'purrr-client-git')
options=('!strip' '!debug')
# The .deb Tauri produces already carries the binary, .desktop entry and icons.
source=("${_pkgname}-${pkgver}.deb::https://git.purrr.chat/ashley/purrr-client/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
noextract=("${_pkgname}-${pkgver}.deb")
# TODO: replace with the real hash once the first release is cut (updpkgsums).
sha256sums=('811483b60ed2918d9ce1ce1fa3145bb990fa642ab31f6193b69cab6f0b32a703')

package() {
    # A .deb is an `ar` archive; bsdtar (libarchive) reads it directly.
    bsdtar -xf "${srcdir}/${_pkgname}-${pkgver}.deb" -C "${srcdir}"
    # The payload (binary, .desktop entry, icons) lives in data.tar.*.
    bsdtar -xf "${srcdir}"/data.tar.* -C "${pkgdir}"
}
