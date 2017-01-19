# Maintainer: Det

pkgname=egl-wayland-git
_pkgname=egl-wayland
pkgver=r1.743d702
pkgrel=1
pkgdesc="A work-in-progress implementation of a EGL External Platform library to add client-side Wayland support - Git"
arch=('i686' 'x86_64')
url="https://github.com/NVIDIA/$_pkgname"
license=('MIT')
depends=('mesa' 'wayland' 'eglexternalplatform-git')
makedepends=('git')
conflicts=('nvidia-utils<378.09')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd $_pkgname

  msg2 "Running ./autogen.sh..."
  ./autogen.sh --prefix=/usr

  msg2 "Running make..."
  make
}

package() {
  cd $_pkgname

  msg2 "Running make install..."
  make DESTDIR="$pkgdir" install
} 
