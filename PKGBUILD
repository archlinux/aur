# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=ecosim-git
pkgver=r211.1d2cb9a
pkgrel=1
pkgdesc="An interactive ecosystem and evolution simulator written in C and OpenGL, for GNU/Linux."
arch=('x86_64')
url="https://connor-brooks.com/projects/ecosim/"
depends=('glfw-x11' 'glew')
optdepends=('ffmpeg' 'python' 'python-matplotlib')
makedepends=('make' 'gcc')
provides=("ecosim=$pkgver")
conflicts=("ecosim")
source=("${pkgname}::git+https://github.com/connor-brooks/ecosim.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"

  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${pkgname}"

  make -C src CC="$CC" CFLAGS="$CFLAGS"
}

package() {
  cd "${pkgname}"

  install -Dm0755 src/ecosim "${pkgdir}/usr/bin/ecosim"
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
