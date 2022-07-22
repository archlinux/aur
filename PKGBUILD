# Maintainer: Twann <tw4nn at disroot.org>

_init_system=dinit
_basename=tblock
pkgname=${_basename}-${_init_system}
pkgver=2.2.0
pkgrel=3
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
        "0b803786c5c271eef68aad589b1a497bb7615144ce6eb5fee90c0e8e4255c9ca25d05885c897f34f867792b220f5fcfd1a9d4b62eff64a4214bc184131b3d36b"
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
