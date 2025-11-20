# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=python-textualeffects
_pkgname=textualeffects
pkgver=0.1.4
pkgrel=1
pkgdesc="Visual effects for Textual, a TermincalTextEffects wrapper."
url="https://github.com/ggozad/textualeffects"
arch=('any')
license=('MIT')

makedepends=('python-installer' 'uv')
depends=('python' 'python-textual' 'python-rich' 'python-terminaltexteffects')

source=("${pkgname}-${pkgver}.tgz::https://github.com/ggozad/textualeffects/archive/${pkgver}.tar.gz")
b2sums=('ace677eba2fdd9d3c6f265ff81807b5a76e6167ad4a2128ffec0ad9362e0a41d54f300aeeb4e853800a40640627724fc563038b3b5a41968fe59f6a4d0fa08f8')

build() {
	cd "$_pkgname-$pkgver" || exit

	uvx --from build pyproject-build --installer uv
}

package() {
	cd "${_pkgname}-${pkgver}" || exit

	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
