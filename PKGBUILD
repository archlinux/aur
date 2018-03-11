# Maintainer: Daniel Haß <aur@hass.onl>
pkgname=standardnotes-desktop
_pkgname=desktop
pkgver=2.1.22
pkgrel=1
pkgdesc="A standard notes app with an un-standard focus on longevity, portability, and privacy."
arch=('x86_64')
url="https://standardnotes.org/"
license=('GPL3')
conflicts=('sn-bin')
depends=('electron')
makedepends=('yarn')
source=("https://github.com/standardnotes/desktop/archive/v$pkgver.tar.gz"
        'standardnotes-desktop.desktop'
        'standardnotes-desktop.js')
sha256sums=('60055d5cff5784bddfc9e05bd8abd7983a2dc0936d948ae15a028e14b508befd'
            '11e0f47494b09b95710399427f849d5693e97e39e7346469ac82da61138b7ca6'
            '16934b1dc1d88d668dd657e991cc58c7292a398fec3aab193478e9988882673d')

build() {
  cd $srcdir/$_pkgname-$pkgver/
  yarn install
  yarn build
}


package() {
  mkdir -p $pkgdir/opt/$pkgname
  cp -r $srcdir/$_pkgname-$pkgver/app $pkgdir/opt/$pkgname/

  install -D -m644 $pkgname.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 $srcdir/$_pkgname-$pkgver/build/icon/Icon-512x512.png "${pkgdir}/usr/share/icons/standard-notes.png"
  install -D -m655 $pkgname.js "${pkgdir}/usr/bin/${pkgname}"
}
