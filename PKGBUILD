# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=textsnatcher
pkgver=2.0.0
pkgrel=1
pkgdesc="Snatch Text with just a Drag"
arch=('x86_64')
url="https://textsnatcher.rf.gd"
license=('GPL-3.0-or-later')
depends=('granite' 'libhandy' 'libportal' 'tesseract')
makedepends=('meson' 'vala')
optdepends=('scrot: screenshot access on Xorg'
            'xdg-desktop-portal: screenshot access on Wayland')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RajSolai/TextSnatcher/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0467a720b96ddfcdef822d7ed794d9ad3973fc39223851b4a82ba2de7715f220')

build() {
  arch-meson TextSnatcher-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  ln -s "/usr/bin/com.github.rajsolai.$pkgname" "$pkgdir/usr/bin/$pkgname"
}
