# Maintainer: Twann <tw4nn at disroot.org>

_init_system=openrc
_basename=tblock
pkgname=${_basename}-${_init_system}
pkgver=2.3.0
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
        "2f2498cfc4b0ee28bf6d0b671013036bf0b2ddb65da86f2d83e2bbb42cf3f525bdb6b55a799329da5f4647dbb4b0e6deb543c2c4d02a763cf8b360e17ad5d9de"
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
