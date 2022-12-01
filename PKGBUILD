# Maintainer: Twann <tw4nn at disroot.org>

_init_system=dinit
_basename=tblock
pkgname=${_basename}-${_init_system}
pkgver=2.6.0
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
        "tblockd::https://codeberg.org/tblock/tblock/raw/commit/a324fd2424baf3f6208c40246ecbe9eaa4fa89b4/assets/services/dinit/tblockd"
)
sha512sums=(
	"78218f380bd419f7364f229cd7c4b68e784f7932660f2fe9886c619c173fe1aa56a1d89498cfabbe98186a94ebd6f5de1b7473f84149e6957837c5de5b37ab27"
        "036e85bafeb5c9c1a62340124576c48603138851cf6bd23e93913c404aa3bfc1b7beda23c6bbd7c714d069f8ba756dfb3af4c29accb45aacabe03732e714ddf7"
)
backup=("etc/tblock.conf")

build()
{
        cd "$srcdir/$_basename"
        make
}

package()
{
        install -Dm644 tblockd "$pkgdir/etc/dinit.d/tblockd"
        cd "$srcdir/$_basename"
        # Install the package
        make install-files install-python-module ROOT="$pkgdir"
        # Install the configuration file
        make install-config ROOT="$pkgdir"
}
