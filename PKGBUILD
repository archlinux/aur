# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=ecosim-git
pkgver=r194.a2c2d33
pkgrel=1
pkgdesc="An interactive ecosystem and evolution simulator written in C and OpenGL, for GNU/Linux."
arch=('x86_64')
url="http://connor-brooks.com/ecosim"
depends=('glfw-x11' 'glew')
optdepends=('python' 'ffmpeg' 'matplotlib')
makedepends=('make' 'gcc')
provides=("ecosim=$pkgver")
conflicts=("ecosim")
source=("$pkgname::git://github.com/connor-brooks/ecosim.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"

  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$pkgname/src"

  make CC="$CC" CFLAGS="$CFLAGS"
}

package() {
  cd "$pkgname/src"

  install -Dm0755 ecosim "${pkgdir}"/usr/bin/ecosim
}
