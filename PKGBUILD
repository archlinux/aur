# Maintainer: Hugo Mantinhas <hugofbmantinhas@gmail.com>
_projectname=declaro
pkgname="$_projectname-git"
pkgver=1.0.0.r17.ga62ee66
pkgrel=1
pkgdesc="a simple declarative wrapper for any package manager"
arch=('x86_64')
url="https://github.com/mantinhas/$_projectname"
license=('GPL')
depends=('pacman' 'bash' 'diffutils' 'sed' 'findutils' 'make' 'sudo' 'coreutils')
makedepends=('git')
source=("git+$url.git")
sha256sums=("SKIP")
PACKAGER="Hugo Mantinhas <hugofbmantinhas@gmail.com>"

_DECLARO_CONFIG_DIR="/etc/$_projectname"

pkgver() {
    cd "$srcdir/${_projectname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() {
    cd "$srcdir/${_projectname}"
    make DESTDIR="$pkgdir" PREFIX=/usr SUDO=' ' install
}

post_install() {
    mkdir -p $_DECLARO_CONFIG_DIR && cp "$srcdir/${_projectname}/config/pacman-config.sh" "$pkgdir/$_DECLARO_CONFIG_DIR/config.sh"
}
