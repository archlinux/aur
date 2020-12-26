# Maintainer: oi_wtf <brainpower at mailbox dot org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: lynix <lynix47@gmail.com>
# Derived from 'dina-font-otb' by Ckat <ckat@teknik.io>

pkgname=terminus-font-td1-otb
pkgver=4.49
pkgrel=1

pkgdesc='Monospace bitmap font (OTB version) with td1 patch (centered ascii tilde)'
url='http://terminus-font.sourceforge.net/'
arch=('any')
license=('GPL2' 'custom:OFL')

makedepends=('python')

conflicts=('terminus-font-otb')
provides=('terminus-font-otb')

source=("https://downloads.sourceforge.net/project/terminus-font/terminus-font-$pkgver/terminus-font-$pkgver.tar.gz")
sha256sums=('db0a74551a23d2229db6ffea469ca8e390625ace4069dd1c1a3d05a16ed2634d')

prepare() {
  cd "terminus-font-$pkgver"

  chmod +x configure
}

build() {
  cd "terminus-font-$pkgver"

  patch < alt/td1.diff

  ./configure \
    --prefix=/usr \
    --otbdir=/usr/share/fonts/misc \
    --x11dir=/usr/share/fonts/misc

  make otb
}

package() {
  cd "terminus-font-$pkgver"

  make DESTDIR="${pkgdir}" install-otb

  install -D -m0644 'OFL.TXT' "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
