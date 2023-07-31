# Maintainer: Twann <tw4nn at disroot.org>

pkgname=tblock
pkgver=2.7.1
pkgrel=1
provides=("$pkgname")
pkgdesc="An anti-capitalist ad-blocker that uses the hosts file"
url="https://tblock.me"
arch=("any")
license=("GPL3")
install="$pkgname.install"
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
)
optdepends=(
	"tblock-gui: graphical interface support"
	"systemd: automatic updates support for Arch Linux"
	"openrc: automatic updates support for OpenRC systems"
	"runit: automatic updates support for runit systems"
	"dinit: automatic updates support for dinit systems"
)
source=(
        "${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tblock/tblock/archive/${pkgver}.tar.gz"
)
sha512sums=(
	"67021d9065eb6304ed018b5926c5e971a7f76a70013099e9d0e3dded908b3d106c27d27b37fe64d6f9b65d932a1e71e0b71d75f68de61a29c820cfc2cdc30aed"
)
backup=("etc/tblock.conf")

build()
{
        cd "$srcdir/$pkgname"
        make
}

package()
{
        cd "$srcdir/$pkgname"
        # Install the package
        make install ROOT="$pkgdir"
        # Install the configuration file
        make install-config ROOT="$pkgdir"
}
