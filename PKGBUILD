# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
pkgname=apulse-git
pkgver=0.1.12_r5_gbcd55c8
pkgrel=1
pkgdesc="Pulseaudio emulation for ALSA"
arch=('i686' 'x86_64')
url="https://github.com/i-rinat/apulse"
license=('MIT')
depends=('alsa-lib' 'glib2')
makedepends=('cmake' 'git')
provides=('apulse')
conflicts=('apulse')
source=(git+"https://github.com/i-rinat/apulse.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed -e 's:^v::' -e 's:\([^-]*-g\):r\1:;s:-:_:g' 
}

prepare() {
  mkdir -p ${pkgname%-git}/build
}

build() {
  cd ${pkgname%-git}/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd ${pkgname%-git}/build
  make DESTDIR="${pkgdir}/" install
  install -Dm644 ../LICENSE.MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
