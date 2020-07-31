# Maintainer: João Figueiredo <jf dot mundox at gmail dot com> (29/05/2020)
# Contributor: Xwang (Fixed a compiling issue, 30/05/2020)
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Stefano Zamprogno <stefano dot zamprogno at gmail dot com>

pkgname=knemo
pkgver=0.7.7.git20151003
pkgrel=7
pkgdesc="The KDE Network Monitor"
arch=('x86_64')
url="https://www.linux-apps.com/content/show.php?content=12956"
license=('GPL')
depends=('kdelibs4support' 'libksysguard' 'knotifyconfig' 'wireless_tools' 'iw' 'plasma-framework' 'hicolor-icon-theme')
makedepends=('extra-cmake-modules' 'kcmutils' 'plasma-framework' 'kdoctools' 'git' 'kdesignerplugin' 'kinit')
options=('libtool')
_commit=f3afe2e4b6f091f21a64905965abafd2ef46826d  # frameworks
source=("git+https://github.com/KDE/knemo.git#commit=$_commit" 'knemo-gcc6.patch')
sha256sums=('SKIP'
            '840fe4f68ff6b9e801d98482a0b76f42764332d81071589ac3bc5632bfc49d92')

prepare() {
  mkdir -p build

  cd knemo
# Fix build with GCC 6
  patch -p1 -i ../knemo-gcc6.patch
}

build() {
  cd build

  cmake ../${pkgname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
