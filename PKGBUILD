# Maintainer: Talha Caglar <talhacaglarr@proton.me>
pkgname=pritingo
pkgver=0.1.0
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
sha256sums=('1b3a6118949d3109174291f1fdf75dda7193c990393570f2b9621bb9efb468f9')

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
