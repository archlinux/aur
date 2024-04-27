# Maintainer: Twann <tw4nn at disroot.org>

pkgname=tblock
pkgver=2.7.3
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
	"ed2bb661e426a767e2cd00b8ac7fb88bf7e1d5ac31bd9759b00bdff036decfaa275f94b757ebb9358f70a0070a34aa7b1801b450f99b05f05ac9428dc8f05b0b"
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
