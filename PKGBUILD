# Maintainer: Twann <tw4nn at disroot.org>

_init_system=openrc
_basename=tblock
pkgname=${_basename}-${_init_system}
pkgver=2.2.0
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
        "${_init_system}"
)
source=(
        "${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tblock/tblock/archive/${pkgver}.tar.gz"
)
sha512sums=(
        "0b803786c5c271eef68aad589b1a497bb7615144ce6eb5fee90c0e8e4255c9ca25d05885c897f34f867792b220f5fcfd1a9d4b62eff64a4214bc184131b3d36b"
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
