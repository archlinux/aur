# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-freiner
pkgver=3.0.5
pkgrel=1
pkgdesc="Generic rate limiting solution for python applications, supporting various strategies and storage backends."
arch=("any")
url="https://github.com/djmattyg007/freiner/"
license=("MIT")
depends=("python" "python-typing_extensions")
makedepends=("python-setuptools")
# I haven't had time to test building the docs now that other parts of the AUR Python ecosystem have improved.
#makedepends=("python-setuptools" "python-sphinx" "python-sphinx_rtd_theme" "python-pymemcache" "python-redis" "python-rediscluster")
source=("https://pypi.io/packages/source/f/freiner/freiner-${pkgver}.tar.gz")
sha256sums=("bf622e06fb1a4a4e497e235da61f6f3d103c3105b8f7fe3dd546b1ab39725bc2")

build() {
    cd "freiner-${pkgver}"

    python setup.py build

    #cd docs
    #sphinx-build -nb html -d build/doctrees . build/html
}

package() {
    cd "freiner-${pkgver}"

    PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-freiner/LICENSE.txt"
    install -Dm644 README.rst "${pkgdir}/usr/share/doc/python-freiner/README.rst"
    install -Dm644 CHANGELOG.rst "${pkgdir}/usr/share/doc/python-freiner/CHANGELOG.rst"
    #cp -r docs/build/html "${pkgdir}/usr/share/doc/python-freiner/html"
}
