# Maintainer: KiWi42 < pullthisplug dash aur at yahoo dot com >

pkgname=scans2any
pkgver=0.8.1
pkgrel=1
pkgdesc="Convert and merge infrastructure scans to Typst, Markdown, HTML, ..."
arch=("any")
url="https://github.com/softScheck/scans2any"
license=("AGPL-3.0-or-later")
provides=(scans2any)
conflicts=(scans2any-git)
depends=(python python-defusedxml python-jinja python-libnmap python-pandas
	python-partial-json-parser python-sortedcontainers python-tabulate
	python-tqdm python-yaml)
makedepends=(python-build python-installer python-wheel uv)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver.tar.gz)
sha256sums=("cdeb68a84570c7ce0ae8829ff1eefb1257170c78016556522d62ab39257d17a3")


build() {
	cd ${pkgname}-${pkgver}
	python -m build --wheel
}


package() {
	# Install python module
	cd ${pkgname}-${pkgver}
	python -m installer --destdir="$pkgdir" dist/*.whl

	# Install scans2markdown executable
	mkdir -p "${pkgdir}/usr/bin"
	install src/scans2any/main.py "${pkgdir}/usr/bin/scans2any"

	# install zsh completion file _scans2markdown as well as man page
	mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
	mkdir -p "${pkgdir}/usr/share/man/man1"
	install -m 644 data/_scans2any "${pkgdir}/usr/share/zsh/site-functions/_scans2any"
	install -m 644 data/scans2any.1 "${pkgdir}/usr/share/man/man1/scans2any.1"
}
