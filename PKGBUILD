# Maintainer: Talha Caglar <talhacaglarr@proton.me>
pkgname=pritingo
pkgver=0.2.1
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
sha256sums=('8e4ef2341345fa712aaa1b77283fcb8ee70c9270293c35b1495c5e47c805b433')

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
