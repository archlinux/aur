# Maintainer: Twann <tw4nn at disroot.org>

pkgname=tblock
pkgver=2.7.5
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
	"924a7d757033a58e88210527fe27525810fdd2010118d457cf185ac58ffeacad0cdd16109ba9db2056ac2989d220d617f53d5f00c8ccb6d9977df1682aa47845"
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
