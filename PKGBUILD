# $Id$
# Maintainer: Sławomir Kowalski <suawekk+aur@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Timm Preetz <timm@preetz.us>
# Contributor: Michael 'manveru' Fellinger <m.fellinger@gmail.com>
# Contributor: Dave Pretty <david dot pretty at gmail dot com>

pkgname=anki20
pkgver=2.0.41
pkgrel=1
pkgdesc="Helps you remember facts (like words/phrases in a foreign language) efficiently"
url="http://ankisrs.net/"
license=('AGPL3')
arch=('any')
depends=('python2-pyqt4' 'python2-beautifulsoup3' 'python2-httplib2' 'python2-sqlalchemy')
optdepends=('mplayer: sound playing')
source=(https://apps.ankiweb.net/downloads/current/anki-$pkgver-source.tgz)
sha256sums=('f9e8498d62cda2c2892ca2141ec1a318159499c6b280edeaf8c2b95e97e3ab4e')

prepare() {
    cd "$srcdir"/anki-$pkgverarchw
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' anki/anki runanki
}

package() {
  cd "$srcdir"/anki-$pkgver
  mkdir -p "$pkgdir"/usr/{bin,share/{anki,pixmaps,applications,man/man1}}
  cp -av * "$pkgdir"/usr/share/anki/
  cd "$pkgdir"/usr/share/anki && (
    mv runanki ../../bin/anki
    mv anki.xpm anki.png ../pixmaps/
    mv anki.desktop ../applications/
    mv anki.1 ../man/man1/
  )
  rm -rf "$pkgdir"/usr/share/anki/{tests,thirdparty/[!s]*,tools,anki.bat}
}
