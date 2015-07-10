# Maintainer: Yaohan Chen <yaohan.chen@gmail.com>

pkgname='sddm-config-editor-git'
_pkgname='sddm-config-editor'
pkgdesc='SDDM Configuration Editor'
url='https://github.com/hagabaka/sddm-config-editor'
license=('APACHE')
pkgver=0.1.r21.g8cd5edc
pkgrel=1
source=('git+https://github.com/hagabaka/sddm-config-editor.git')
md5sums=('SKIP')
depends=('qt5-quickcontrols' 'sddm' 'polkit')
makedepends=('git' 'qt5-tools')
arch=('i686' 'x86_64')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgname/cpp"
  qmake PREFIX="$pkgdir"
  make
}

package() {
  cd "$srcdir/$_pkgname/cpp"
  make install
}

