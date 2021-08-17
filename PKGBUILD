# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-freiner
pkgver=3.0.4
pkgrel=1
pkgdesc="Generic rate limiting solution for python applications, supporting various strategies and storage backends."
arch=("any")
url="https://github.com/djmattyg007/freiner/"
license=("MIT")
depends=("python" "python-typing_extensions")
makedepends=("python-setuptools")
# Right now pymemcache doesn't even build, and I still have to package python-rediscluster
#makedepends=("python-setuptools" "python-sphinx" "python-sphinx_rtd_theme" "python-pymemcache" "python-redis" "python-rediscluster")
source=("https://pypi.io/packages/source/f/freiner/freiner-${pkgver}.tar.gz")
sha256sums=("b9e660460c9b194b160233d0a59ce1b1968ea43d7b5798972c84bb17594f205f")

build() {
    cd "freiner-${pkgver}"

    python setup.py build

    #cd docs
    #sphinx-build -nb html -d build/doctrees . build/html
}

package() {
    cd "freiner-${pkgver}"

    PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/freiner/LICENSE.txt"
    install -Dm644 CHANGELOG.rst "${pkgdir}/usr/share/doc/python-humanfriendly/CHANGELOG.rst"
    #cp -r docs/build/html "${pkgdir}/usr/share/doc/python-humanfriendly/html"
}
