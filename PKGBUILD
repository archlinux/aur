# Maintainer: Dillan Mills <archlinux@dillan.org>

_pkgname=ollama-grid-search
pkgname=ollama-grid-search-bin
pkgdesc="A tool to perform grid search on models using Ollama"
pkgver=0.9.1
pkgrel=1
url="https://github.com/dezoito/ollama-grid-search"
arch=('x86_64')
_arch=('amd64')
license=('MIT')
makedepends=('dpkg')
options=(!strip)
_deb="${_pkgname}_${pkgver}_${_arch}.deb"
noextract=("${_deb}")
source_x86_64=("${_deb}::https://github.com/dezoito/${_pkgname}/releases/download/v${pkgver}/${_deb}")
sha256sums_x86_64=('3736a0307ce04ac7f44e5e747e96dde2eee6a9ef8575cdb2e56f91ac1b917279')

prepare() {
	dpkg-deb -x "${srcdir}/${_deb}" "${srcdir}/package"
}

build() {
    # Nothing to compile
	true
}

package() {

	# Install binary
	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 "${srcdir}/package/usr/bin/ollama-grid-search" "${pkgdir}/usr/bin/ollama-grid-search"

	# Install desktop file
	install -dm755 "${pkgdir}/usr/share/applications"
	install -Dm644 "${srcdir}/package/usr/share/applications/ollama-grid-search.desktop" "${pkgdir}/usr/share/applications/ollama-grid-search.desktop"

	# Install icons
	install -dm755 "${pkgdir}/usr/share/"
	cp -a "${srcdir}/package/usr/share/icons" "${pkgdir}/usr/share/"
}