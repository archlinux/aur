# Maintainer: oi_wtf <brainpower at mailbox dot org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: lynix <lynix47@gmail.com>
# Derived from 'dina-font-otb' by Ckat <ckat@teknik.io>

pkgname=terminus-font-td1-otb
pkgver=4.49.1
pkgrel=1

pkgdesc='Monospace bitmap font (OTB version) with td1 patch (centered ascii tilde)'
url='http://terminus-font.sourceforge.net/'
arch=('any')
license=('GPL2' 'custom:OFL')

makedepends=('python')

conflicts=('terminus-font-otb')
provides=('terminus-font-otb')

source=("https://downloads.sourceforge.net/project/terminus-font/terminus-font-${pkgver%.*}/terminus-font-$pkgver.tar.gz")
sha256sums=('d961c1b781627bf417f9b340693d64fc219e0113ad3a3af1a3424c7aa373ef79')

prepare() {
  cd "terminus-font-$pkgver"

  chmod +x configure
}

build() {
  cd "terminus-font-$pkgver"

  patch < alt/td1.diff

  ./configure \
    --prefix=/usr \
    --otbdir=/usr/share/fonts/misc

  make otb
}

package() {
  cd "terminus-font-$pkgver"

  make DESTDIR="${pkgdir}" install-otb

  install -D -m0644 'OFL.TXT' "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
