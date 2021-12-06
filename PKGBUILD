# Contributor: Qontinuum <qontinuum.dev@protonmail.ch>
# Contributor: Ricardo Madriz <richin13@gmail.com>
# Contributor: Aoibhinn di Tori <email@aoibh.in>
# Contributor: Lara Maia <lara@craft.net.br>
# Contributor: estranho <estranho@diogoleal.com>
# Contributor: tsester <spyridon.papanastasiou@gmail.com>
# Contributor: dserban <dserban01@yahoo.com>
# Contributor: LeCrayonVert <sunrider@laposte.net>
# Contributor: jelly <jelle@vdwaa.nl>
# Contributor: evr <evanroman at gmail>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=agedu
pkgver=20211129
_commit=.8cd63c5
pkgrel=1
pkgdesc="A UNIX utility for tracking down wasted disk space"
arch=('i686' 'x86_64')
url="http://www.chiark.greenend.org.uk/~sgtatham/agedu/"
license=('custom:MIT')
depends=('glibc')
makedepends=('cmake')
source=("https://www.chiark.greenend.org.uk/~sgtatham/agedu/agedu-${pkgver}${_commit}.tar.gz")
sha256sums=('ceaee592ef21b8cbb254aa7e9c5d22cefab24535e137618a4d0af591eba8339f')

build() {
  cd $pkgname-$pkgver${_commit}
  [[ -d build ]] || mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
  make
}

package() {
  cd $pkgname-$pkgver${_commit}/build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
