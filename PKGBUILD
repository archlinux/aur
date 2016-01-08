# Maintainer: Bogdan Sinitsyn <bogdan.sinitsyn@gmail.com>

_pkgname=skype1ico
pkgname="$_pkgname-git"
pkgver=1.0.0.r5.g7f05c5e
pkgrel=2
pkgdesc="Makes Skype systray icon monochrome"
arch=(x86_64 i686)
url="https://github.com/derlaft/skype1ico"
license=('GPL')
depends=(skype)
depends_x86_64=(lib32-qt4 lib32-libx11)
depends_i686=(qt4 libx11)
install=skype1ico.install
source=('git+https://github.com/derlaft/skype1ico.git' qmake.patch)
sha256sums=('SKIP'
            'd68eabadcbb7e692134d7c1ee955571335d82b57aa1c22d9d1bbcd75d1cbecc1')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
# install to /usr/lib32 on 64-bit systems
  patch -p1 < ../../qmake.patch
}

build() {
  cd "$_pkgname"
  qmake-qt4 -spec linux-g++-32 PREFIX="$pkgdir/usr/"
  make
}

package() {
  cd "$_pkgname"
  make install
}

# vim:set ts=2 sw=2 et:
