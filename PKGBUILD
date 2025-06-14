# Maintainer: Hugo Mantinhas <hugofbmantinhas@gmail.com>
_projectname=declaro
pkgname="$_projectname-git"
pkgver=0
pkgrel=3
pkgdesc="a simple declarative wrapper for any package manager"
arch=('x86_64')
url="https://github.com/mantinhas/$_projectname"
license=('GPL')
depends=('pacman' 'bash' 'diffutils' 'sed' 'findutils' 'make' 'sudo' 'coreutils' 'tar' 'git')
makedepends=('git')
source=("git+$url.git")
sha256sums=("SKIP")
backup=('etc/declaro/config.sh')
PACKAGER="Hugo Mantinhas <hugofbmantinhas@gmail.com>"

pkgver() {
    cd "$srcdir/${_projectname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() {
    cd "$srcdir/${_projectname}"
    make DESTDIR="$pkgdir" PREFIX=/usr SUDO=' ' install install-config
}
