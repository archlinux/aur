# Maintainer: Twann <tw4nn@riseup.net>

_basename=tblock
pkgname=${_basename}-openrc
pkgver=2.0.0
pkgrel=1
provides=("$_basename")
pkgdesc="An anti-capitalist ad-blocker that uses the hosts file"
url="https://tblock.codeberg.page"
arch=("any")
license=("GPL3")
conflicts=("$_basename")
makedepends=(
        "make"
        "pandoc"
        "gzip"
        "python>=3"
        "python-setuptools"
)
depends=(
        "python-urllib3"
        "python-requests"
        "python-colorama"
        "python-defusedxml"
)
source=(
        "${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tblock/tblock/archive/${pkgver}.tar.gz"
)
sha512sums=(
        "4679aa834f760f6c938004d3c2738ba91fa4e4293cee1223de960c81bcc1cd1b80720ecc82f82ac5a0964fc34236deba22bf1a46c4b619294a445b25ba2a74ad"
)
backup=("etc/tblock.conf")

build()
{
        cd "$srcdir/$_basename"
        make
}

package()
{
        cd "$srcdir/$_basename"
        # Install the package
        make install-openrc ROOT="$pkgdir"
        # Install the configuration file
        make install-config ROOT="$pkgdir"
}
