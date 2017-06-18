# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
pkgname=apulse-git
pkgver=0.1.10_r12_gee63fd3
pkgrel=1
pkgdesc="Pulseaudio emulation for ALSA"
arch=('i686' 'x86_64')
url="http://github.com/i-rinat/apulse"
license=('MIT')
depends=('alsa-lib' 'glib2')
makedepends=('cmake' 'git')
provides=('apulse')
conflicts=('apulse')
source=(git+"https://github.com/i-rinat/apulse.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --tags | sed -e 's:^v::' -e 's:\([^-]*-g\):r\1:;s:-:_:g' 
}

build() {
  cd "$srcdir/${pkgname%-git}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE.MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
