# Maintainer: Talha Caglar <talhacaglarr@proton.me>
pkgname=pritingo
pkgver=0.1.1
pkgrel=1
pkgdesc='Print on Canon PIXMA E400-series printers one page per job, with guided two-sided printing'
arch=('x86_64' 'aarch64')
url='https://github.com/talhacaglar/pritingo'
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'qt6-wayland' 'xdg-desktop-portal' 'cups' 'poppler' 'qpdf'
         'imagemagick' 'libnotify' 'cnijfilter-e400series')
optdepends=('libreoffice: open Word, Excel, PowerPoint and LibreOffice files'
            'libcanberra: sounds when the fronts or the whole job are done')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('83545a91f7d23c148b2ed8f676155d111845bceb60f9c1a8b4ffd0e9e398b8e8')

build() {
  cd "$pkgname-$pkgver"
  qmake6 pritingo.pro
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 pritingo "$pkgdir/usr/bin/pritingo"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 pkgbuild/pritingo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/pritingo.svg"
  install -Dm644 pkgbuild/pritingo.desktop "$pkgdir/usr/share/applications/pritingo.desktop"
}
