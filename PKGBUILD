# Maintainer: Talha Caglar <talhacaglarr@proton.me>
pkgname=pritingo
pkgver=0.2.0
pkgrel=1
pkgdesc='Print on Canon PIXMA E400-series printers one page per job, with guided two-sided printing, and scan to PDF'
arch=('x86_64' 'aarch64')
url='https://github.com/talhacaglar/pritingo'
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'qt6-wayland' 'xdg-desktop-portal' 'cups' 'poppler' 'qpdf'
         'imagemagick' 'libnotify' 'cnijfilter-e400series')
optdepends=('libreoffice: open Word, Excel, PowerPoint and LibreOffice files'
            'libcanberra: sounds when the fronts or the whole job are done'
            'sane: scan from the printer'\''s glass to a PDF or a copy')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('93ab6ea14cf66c2b08094a4b939cea9c03d353cd33900e394a9d0c7742a48ea1')

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
