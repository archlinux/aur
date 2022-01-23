# Maintainer: Matthew Gamble <git@matthewgamble.net>
# Contributor: Frederick Gnodtke <fgnodtke at cronosx dot de>

pkgname=mopidy-subidy
pkgver=1.2.0
pkgrel=2
pkgdesc="Mopidy extension for playing music from Subsonic servers"
arch=("any")
url="https://github.com/Prior99/mopidy-subidy"
license=('BSD')
depends=(
    "mopidy"
    "python"
    "python-setuptools"
    "python-pykka"
    "python-pysonic"
)
# There is no "official" release tarball for v1.2.0, see github issue #42
#source=("https://github.com/prior99/${pkgname}/archive/${pkgver}.tar.gz")
_pkgver_commit="e8493923c1c15db1424d41444aa799c81a337e57"
source=("https://github.com/Prior99/mopidy-subidy/archive/${_pkgver_commit}.tar.gz")
sha256sums=("5289e09be1f8dba8fbd6bd347d54e4d6bb07f6238c3a2af21a0fc4bd9c6c89cb")

build() {
    #cd "mopidy-subidy-${pkgver}"
    cd "mopidy-subidy-${_pkgver_commit}"

    python setup.py build
}

package() {
    #cd "mopidy-subidy-${pkgver}"
    cd "mopidy-subidy-${_pkgver_commit}"

    PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/mopidy-subidy/LICENSE"
    install -Dm644 README.rst "${pkgdir}/usr/share/doc/mopidy-subidy/README.rst"
    install -Dm644 CHANGELOG.rst "${pkgdir}/usr/share/doc/mopidy-subidy/CHANGELOG.rst"
}
