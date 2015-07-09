# Maintainer: Sam S. <smls75@gmail.com>

pkgname=pngrim-git
pkgver=r5.9f13288
pkgrel=1
pkgdesc="A tool that fixes PNG images to prevent white borders when used as OpenGL textures"
url='https://github.com/fgenesis/pngrim'
arch=('i686' 'x86_64')
license=('WTFPL')
depends=('gcc-libs')
makedepends=('cmake')

_gitname=pngrim
source=("git://github.com/fgenesis/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Automatically generate package version from git commit number
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $_gitname
  cmake .
  make
}

package() {
  cd $pkgdir

  # Install executable
  install -Dm755 "$srcdir/$_gitname/src/pngrim/pngrim" usr/bin/pngrim

  # Install documentation
  install -Dm644 "$srcdir/$_gitname/README" usr/share/doc/pngrim/README
  cp -r "$srcdir/$_gitname"/example usr/share/doc/pngrim/
}
