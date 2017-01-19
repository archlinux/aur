# Maintainer: Det

pkgname=eglexternalplatform-git
_pkgname=eglexternalplatform
pkgver=r1.53bf47c
pkgrel=1
pkgdesc="A work-in-progress specification of the EGL External Platform interface for modern window systems - Git"
arch=('any')
url="https://github.com/NVIDIA/$_pkgname"
license=('MIT')
makedepends=('git')
source=("git+$url.git")
md5sums=('SKIP')
conflicts=("$_pkgname")
provides=("$_pkgname")

pkgver() {
  cd $_pkgname
  
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd $_pkgname
  
  # headers
  install -Dm644 interface/eglexternalplatform.h \
                 "$pkgdir"/usr/include/EGL/eglexternalplatform.h
  install -Dm644 interface/eglexternalplatformversion.h \
                 "$pkgdir"/usr/include/EGL/eglexternalplatformversion.h

  # source
  cp -r samples "$pkgdir"/usr/include/EGL/

  # pkgconfig     
  install -Dm644 eglexternalplatform.pc \
                 "$pkgdir"/usr/lib/pkgconfig/eglexternalplatform.pc
} 
