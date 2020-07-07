# Maintainer: oi_wtf <brainpower at mailbox dot org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: lynix <lynix47@gmail.com>
# Derived from 'dina-font-otb' by Ckat <ckat@teknik.io>

pkgname=terminus-font-td1-otb
pkgver=4.48
pkgrel=2

pkgdesc='Monospace bitmap font (OTB version) with td1 patch (centered ascii tilde)'
url='http://terminus-font.sourceforge.net/'
arch=('any')
license=('GPL2' 'custom:OFL')

makedepends=('fontforge')

conflicts=('terminus-font-otb')
provides=('terminus-font-otb')

source=("https://downloads.sourceforge.net/project/terminus-font/terminus-font-$pkgver/terminus-font-$pkgver.tar.gz"
        'otbconvert.pe')
sha256sums=('34799c8dd5cec7db8016b4a615820dfb43b395575afbb24fc17ee19c869c94af'
            '431999be6be2630a9e8b4bcc5631b6bc727b795978b75cb4c874d9ce143e9703')


build() {
  cd "terminus-font-$pkgver"

  patch < alt/td1.diff

  ../otbconvert.pe *.bdf
}

package() {
  cd "terminus-font-$pkgver"
  for i in *.otb; do
      install -D -m0644 $i "$pkgdir/usr/share/fonts/misc/$i"
  done
  install -D -m0644 'OFL.TXT' "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
