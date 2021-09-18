# Maintainer: Sanjay Pavan <tsppavan7@gmail.com>

pkgname=nsxiv
pkgver=27.1
pkgrel=2
pkgdesc='Neo (or New or Not) Simple (or Small or Suckless) X Image Viewer'
arch=('x86_64')
license=('GPL2')
url='https://github.com/nsxiv/nsxiv'
depends=('imlib2' 'desktop-file-utils' 'xdg-utils' 'hicolor-icon-theme' 'libexif' 'libxft' 'giflib')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/nsxiv/nsxiv/archive/v$pkgver.tar.gz")
sha256sums=('416247c6930d2a5ba482010a7c095fc3e6fe0fe609f2bce0049f69bebd63e00c')

prepare() {
  cd "$pkgname-$pkgver"
  ln -s config.def.h config.h
}

build() {
  make -C "$pkgname-$pkgver"
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  make -C icon PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 nsxiv.desktop "$pkgdir"/usr/share/applications/nsxiv.desktop
}
