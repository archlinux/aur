# Contributor: Matthew Gamble <git@matthewgamble.net>

pkgname=python-urwidtrees
pkgver=1.0.2
pkgrel=3
pkgdesc="Tree widgets for urwid"
arch=("any")
url="https://github.com/pazz/urwidtrees"
license=("GPL")
depends=("python-urwid>=1.1.0")
makedepends=("python-sphinx")
source=("urwidtrees-${pkgver}.tar.gz::https://github.com/pazz/urwidtrees/archive/${pkgver}.tar.gz")
sha256sums=("703f4b161b930a26a461a3e3e695f94237ac75e2a52b87613e49093d9aa76034")

build() {
    cd "urwidtrees-${pkgver}"
    python setup.py build
    make SPHINXBUILD=sphinx-build -C docs man html
}

package() {
    cd "urwidtrees-${pkgver}"
    python setup.py install --root="${pkgdir}" --skip-build
    install -dm755 "${pkgdir}/usr/share/doc/python-urwidtrees"
    for _file in $(find docs/build/html -type f); do
        install -Dm644 ${_file} "${pkgdir}/usr/share/doc/python-urwidtrees/$(basename ${_file})"
    done
}
