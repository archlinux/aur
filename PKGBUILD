# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Andy Kluger <https://t.me/andykluger>
# Contributor: jurplel <jeep70cp[at]gmail[dotcom]>

pkgname=qview-git
pkgver=4.0.r178.ge2bfcf7
pkgrel=1
pkgdesc="Practical and minimal image viewer"
arch=('x86_64')
url="https://interversehq.com/qview/"
license=('GPL3')
depends=('qt5-base' 'qt5-tools')
optdepends=('kimageformats: additional image formats'
            'qt-avif-image-plugin-git: AVIF format'
            'qt5-apng-plugin: APNG format'
            'qt5-heif: HEIF format'
            'qt5-imageformats: additional image formats'
            'qt5-svg: SVG format'
            'qtraw: RAW format')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::git+https://github.com/jurplel/qView.git)
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  qmake PREFIX=/usr
  make
}

package() {
  make -C $pkgname INSTALL_ROOT="$pkgdir/" install
}

