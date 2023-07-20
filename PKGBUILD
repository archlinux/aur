# Maintainer: Twann <tw4nn at disroot.org>

pkgname=tblock
pkgver=2.7.0
pkgrel=2
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
	"53599dafb4f36bca64407e37730ba217842dc6ec2c25209129e3fbd0177307b84073885a301633d74f08c37c45d0033ad7776bda8f2df10f874de9220fddf904"
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
