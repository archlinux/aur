# Maintainer: MaryJaneInChain <maryjaneinchain@gmail.com>

pkgname=tic-80-git
pkgver=r1017.fd45a8d
pkgrel=1
pkgdesc='TIC-80 tiny computer emulator'
arch=('i686' 'x86_64')
url="https://tic.computer/"
license=('MIT')
depends=('gtk3' 'glu' 'freeglut>=3.0.0' 'libglvnd')
makedepends=('git' 'cmake')

_gitname=TIC-80

source=("git+https://github.com/nesbox/TIC-80.git"
    "git+https://github.com/nesbox/3rd-party.git")
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_gitname"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/$_gitname/build"
    cmake ..
    make -j4
}

package() {
    cd "$srcdir/$_gitname/build"
	install -Dm755 bin/tic80 "${pkgdir}/usr/bin/tic80"
}

