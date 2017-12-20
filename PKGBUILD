# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Sebastian Wolf <fatmike303 at googlemail dot com>

pkgname=chipmachine
pkgver=1.4b3
pkgrel=1
pkgdesc='Demoscene/Retro Music Player'
arch=('i686' 'x86_64')
url='https://github.com/sasq64/chipmachine'
license=('MIT')
depends=('mpg123' 'glew' 'glfw' 'curl' 'fftw')
makedepends=('cmake' 'vim')
source=("chipmachine-v1.4b3.tar.gz::https://github.com/sasq64/chipmachine/archive/v1.4b3.tar.gz"
        "apone-chipmachine-v1.4b3.tar.gz::https://github.com/sasq64/apone/archive/chipmachine-v1.4b3.tar.gz"
        "chipmachine"
        "cm")
sha256sums=('b01f123e157d72eee4f4d3784f82b1ab0cc5b4d968067b0af50163321d3f5cb4'
            'e411d6515064bb2c952a95aad6bcfc70c1f6b58f40d7874f671ef26185911156'
            '5b2cc9b2eaa7b7a1fcbad0c405950b0d05f200caa5d99203ce3be988ca1f05ab'
            '75659c95d717851986bbadcf3d3dddb3d72f92720cdd58a97b870e91daf73b5c')

prepare() {
  cd $pkgname-$pkgver
  ln -sf ../apone-chipmachine-v1.4b3 apone
  mkdir -p ../build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd $pkgname-$pkgver
  install -d "$pkgdir"/{usr/bin,opt/chipmachine}
  install -m755 ../build/chipmachine "$pkgdir"/opt/chipmachine/
#  install -m755 ../build/cm "$pkgdir"/opt/chipmachine/
  cp -r data lua "$pkgdir"/opt/chipmachine/
  install -m755 ../chipmachine "$pkgdir"/usr/bin/
#  install -m755 ../cm "$pkgdir"/usr/bin/
  install -Dm644 apone/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
