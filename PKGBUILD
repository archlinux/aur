pkgname=xava
pkgver=0.6.3.0
pkgrel=1
pkgdesc='X11 Audio Visualizer for Alsa/Pulseaudio/FIFO'
arch=('any')
url='https://github.com/nikp123/xava'
license=('MIT')
depends=('fftw' 'alsa-lib' 'iniparser' 'libx11' 'sdl2' 'portaudio' 'sndio' 'mesa')
makedepends=('cmake' 'git')
source=('https://github.com/nikp123/xava/archive/0.6.3.0.tar.gz')
conflicts=('xava-git')
provides=('xava')
sha256sums=('745da4f6690f58e29d9f20ca790b3f354a1f53ef810d4ab6b1027bcac7e62fbf')

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
  install -Dm644 assets/linux/"$pkgname".svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/"$_pkgname".svg
  install -Dm644 example_files/config "$pkgdir"/usr/share/xava/config.example
}

