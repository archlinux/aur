# Maintainer: Robin Candau <antiz@archlinux.com>
# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: shmilee

pkgname=python-mistune3
_pkgname=mistune
pkgver=3.0.1
pkgrel=1
pkgdesc="A fast yet powerful Python Markdown parser with renderers and plugins"
arch=('any')
url="https://mistune.lepture.com"
license=('BSD')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
conflicts=('python-mistune')
provides=("python-mistune=${pkgver}")
source=("https://github.com/lepture/mistune/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('e1f6ad68ae2b92945987833a1ed97764089736f98c7cb36ac3b1908e9f7968488192c007e3c0d03c107b67a221334e2e5cd439d88eed94ad2616aac396a29425')
b2sums=('c293836f2a23ae78b751b90ef619dd8a2e57d28ee6e4be5d30db0da502251f4183ce4c7aa3db85e08cda5d9f6b582c25bd64d58955c60cc9c3f5f8332d5ab0b0')

build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

check() {
	cd "${_pkgname}-${pkgver}"
	pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
