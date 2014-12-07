# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Dennis Hamester <dennis.hamester [AT] gmail [DOT] com>

pkgname=dreamweb-de
pkgver=1.1
pkgrel=1
pkgdesc="A top-down adventure game set in a gritty futuristic dystopian city - german language"
arch=('any')
url="http://www.scummvm.org/"
license=('custom: Freeware')
depends=('scummvm')
source=("http://downloads.sourceforge.net/scummvm/dreamweb-cd-de-$pkgver.zip"
        "$pkgname.sh")
sha256sums=('2d42fbf5dd3a58ea98ebb5c9bb33f3d5b70e92a936013248f67c33f1b82ac74b'
            'dc4994ce76ae22cefce421db3b963c53df0466172013f08bd1cb3e1cc900bd12')
# avoids unnecessary stripping and recompression
options=('!strip')
PKGEXT='.pkg.tar'

package() {
  # launcher
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname

  # data
  install -d "$pkgdir"/usr/share/$pkgname/speech
  install -m644 DREAMWEB.* "$pkgdir"/usr/share/$pkgname
  install -m644 track01.flac "$pkgdir"/usr/share/$pkgname
  install -m644 SPEECH/*.RAW "$pkgdir"/usr/share/$pkgname/speech
  rm "$pkgdir"/usr/share/$pkgname/DREAMWEB.EXE

  # doc
  install -d "$pkgdir"/usr/share/doc/$pkgname/{hand,tage}buch
  install -m644 handbuch/* "$pkgdir"/usr/share/doc/$pkgname/handbuch
  install -m644 tagebuch/* "$pkgdir"/usr/share/doc/$pkgname/tagebuch

  # license
  install -Dm644 license.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
