# Maintainer: Daniel Haß <aur@hass.onl>
pkgname=standardnotes-desktop
_pkgname=desktop
pkgver=2.1.1
pkgrel=1
pkgdesc="A standard notes app with an un-standard focus on longevity, portability, and privacy."
arch=('x86_64')
url="https://standardnotes.org/"
license=('GPL3')
depends=('electron')
makedepends=('yarn')
source=("https://github.com/standardnotes/desktop/archive/v$pkgver.tar.gz"
        'standardnotes-desktop.desktop'
        'standardnotes-desktop.js')
sha256sums=('5dff886bf539f5240a6530c01ed12993054e30b3563029ac6806592e01e5935a'
            'eadf8fe7d871557d733db53fdaefd57fd7c06f21dcaa99a72b3dd6b768d7d969'
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
