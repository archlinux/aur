# Maintainer: Daniel Haß <aur@hass.onl>
pkgname=standardnotes-desktop
_pkgname=desktop
pkgver=1.0.1
pkgrel=1
pkgdesc="A standard notes app with an un-standard focus on longevity, portability, and privacy."
arch=('x86_64')
url="https://standardnotes.org/"
license=('GPL3')
depends=('electron')
makedepends=('npm')
source=("https://github.com/standardnotes/desktop/archive/v$pkgver.tar.gz" 'standard-notes.desktop')
sha256sums=('4eebcd192e8711290db6989bf6d6878dbdb9ddf5be7e1a8c8f3e537395f61629'
            '58cd81f91f9183bd4400159944dee29f92d4d1ba5a218739c83939f40786e1f6')

package() {
  mkdir -p $pkgdir/opt/$pkgname
  cp -r $srcdir/$_pkgname-$pkgver/* $pkgdir/opt/$pkgname/

  install -D -m644 standard-notes.desktop "${pkgdir}/usr/share/applications/standard-notes.desktop"
  install -D -m644 $srcdir/$_pkgname-$pkgver/_icon/icon.png "${pkgdir}/usr/share/icons/standard-notes.png"

  cd $pkgdir/opt/$pkgname/app/
  npm install --production
}
