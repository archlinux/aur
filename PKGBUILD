# Maintainer: Twann <tw4nn at disroot.org>

_init_system=openrc
_basename=tblock
pkgname=${_basename}-${_init_system}
pkgver=2.4.1
pkgrel=1
provides=("$_basename")
pkgdesc="An anti-capitalist ad-blocker that uses the hosts file"
url="https://tblock.codeberg.page"
arch=("any")
license=("GPL3")
conflicts=("$_basename")
makedepends=(
        "make"
        "gzip"
        "python>=3"
        "python-build"
        "python-installer"
        "python-setuptools"
        "python-wheel"
)
depends=(
        "python-urllib3"
        "python-requests"
        "python-colorama"
        "${_init_system}"
)
source=(
        "${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tblock/tblock/archive/${pkgver}.tar.gz"
)
sha512sums=(
        "4ed0e61e6709dcae6a85287279c4c8958092ad7ddb5ec8fbb632b4a959740c9b9cf081a7c7bd9b36d9ad09ee808c3722d97eb4611900d0aa4ff7dd2e224892de"
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
        make install-${_init_system} ROOT="$pkgdir"
        # Install the configuration file
        make install-config ROOT="$pkgdir"
}
