# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=python-textualeffects
_pkgname=textualeffects
pkgver=0.2.0
pkgrel=1
pkgdesc="Visual effects for Textual, a TermincalTextEffects wrapper."
url="https://github.com/ggozad/textualeffects"
arch=('any')
license=('MIT')

makedepends=('python-installer' 'uv')
depends=('python' 'python-textual' 'python-rich' 'python-terminaltexteffects')

source=("${pkgname}-${pkgver}.tgz::https://github.com/ggozad/textualeffects/archive/${pkgver}.tar.gz")
b2sums=('b504554a30160078f97d56bd43ed584e3a1ed84d0113efa8f4e3aaa6803e55be970b41f055a74949fddfc88f7c10c0149a33ef7a9808797854afa8275111a0dd')

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
