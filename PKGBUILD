# Maintainer: Laura Demkowicz-Duffy <dev at demkowiczduffy.co.uk>
# Contributor: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-adblockparser 
_pypiname=adblockparser
pkgver=0.7
pkgrel=3
pkgdesc="A package for working with Adblock Plus filter rules. It can parse Adblock Plus filters and match URLs against them"
url="https://github.com/scrapinghub/adblockparser/"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('python-re2: speed up filters')
source=(${_pypiname}-${pkgver}.tar.gz::"https://github.com/scrapinghub/adblockparser/archive/${pkgver}.tar.gz")
sha256sums=('cb2378a5e704e9cf6efb0c4a9ea5dc43997beec95635f25fc94fae5971f9035c')

build() {
    cd "${_pypiname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pypiname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
