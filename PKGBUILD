# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Andy Kluger <https://t.me/andykluger>
# Contributor: jurplel <jeep70cp[at]gmail[dotcom]>

pkgname=qview-git
pkgver=6.1.r0.g9f6c225
pkgrel=1
pkgdesc='Practical and minimal image viewer'
arch=(x86_64)
url=https://interversehq.com/qview
license=(GPL3)
depends=(hicolor-icon-theme qt5-base qt5-tools)
#            'qt-avif-image-plugin-libavif: AVIF support'
optdepends=('kimageformats: additional image format support'
            'qt-avif-image-plugin-libavif-git: AVIF support'
            'qt-heif-image-plugin: HEIF support'
            'qt5-apng-plugin: APNG support'
            'qt5-imageformats: additional image format support'
            'qt5-svg: SVG support'
            'qtraw: RAW support')
makedepends=(git qt5-x11extras)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/jurplel/qView.git")
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

