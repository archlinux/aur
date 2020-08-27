pkgname=xava
pkgver=0.6.3.1
pkgrel=1
pkgdesc='X11 Audio Visualizer for Alsa/Pulseaudio/FIFO'
arch=('any')
url='https://github.com/nikp123/xava'
license=('MIT')
depends=('fftw' 'alsa-lib' 'iniparser' 'libx11' 'sdl2' 'portaudio' 'sndio' 'mesa')
makedepends=('cmake' 'git')
source=('https://github.com/nikp123/xava/archive/0.6.3.1.tar.gz')
conflicts=('xava-git')
provides=('xava')
sha256sums=('b38b810e4bfd71aff44f223b444ae4f158eb8d6428c5e9d42697343ccb5a19f9')

build() {
  mkdir -p $pkgname-$pkgver/build
  cd $pkgname-$pkgver/build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 build/"$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 build/"$pkgname".desktop "$pkgdir"/usr/share/applications/"$pkgname".desktop
  install -Dm644 assets/linux/"$pkgname".svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/"$pkgname".svg
  install -Dm644 example_files/config "$pkgdir"/usr/share/xava/config.example
}

