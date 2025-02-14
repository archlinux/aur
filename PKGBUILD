# Maintainer: Twann <tw4nn at disroot.org>

pkgname=tblock
pkgver=2.7.4
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
	"32340d80c4cf9258f5ba3c19ab97f4a4ac195e09ca0c11d9da082a5d271f5908e6f8cc4f11b620a6585a5fb1689455298d24fb4132d5f1459c94f971d0d52ca5"
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
