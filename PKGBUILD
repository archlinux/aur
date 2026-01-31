# Contributor: Sam S. <smls75@gmail.com>

pkgname=pngrim-git
pkgver=r10.6ef76bb
pkgrel=1
pkgdesc="A tool that fixes PNG images to prevent white borders when used as OpenGL textures"
url='https://github.com/fgenesis/pngrim'
arch=('x86_64')
license=('LicenseRef-Public-Domain')
depends=('gcc-libs')
makedepends=('cmake' 'git')
_gitname=pngrim
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Automatically generate package version from git commit number
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd $_gitname
  sed -i 's/VERSION [0-9\.]\+/VERSION 4.2/' CMakeLists.txt
}

build() {
  cmake -B build -S $_gitname -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # Install documentation
  install -Dm644 "$_gitname/README" -t "$pkgdir/usr/share/doc/$pkgname"
}
