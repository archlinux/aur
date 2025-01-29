# Maintainer: Fijxu <fijxu at nadeko dot net>

pkgname=spcplay
pkgver=2.20.5.8581
pkgrel=1
pkgdesc="SNES SPC700 Player"
arch=('i686' 'x86_64')
url="https://github.com/dgrfactory/spcplay"
license=('GPL-2.0-only')
depends=('wine')
makedepends=('unzip' 'gendesk')
source=(
  "https://github.com/dgrfactory/spcplay/releases/download/$pkgver/$pkgname-$pkgver.zip"
  'spcplay'
	'spcplay.png'
  'x-spc.xml'
)
noextract=("$pkgname-$pkgver.zip")
sha256sums=(
  'fe65e571e5c307d25fe2522be7b204d00ab1e6fe363b2df6ee81337cea436507'
  '9dbe7462b0901e19f819c8e16dab24e88a013a2f1575fc50fe7c7b7c5eb04f82'
  '6f4127c931c5707c3a4cf1da81cd29c38f336cb3c7fc40f366681cb475217c98'
  'fd1a7c4c7f7da7fb9a5310bdfe06e1fb7feb22b51b2e23cd78debba1ea6b92fe'
)

prepare() {
  cd "$srcdir"
  mkdir -p "$pkgname-$pkgver"
  unzip -o -d "$pkgname-$pkgver" "$pkgname-$pkgver.zip"

  gendesk -n -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
    --name='SPCPlay' \
    --mimetype='audio/x-spc' \
    --categories 'Audio;Sequencer;Midi;Music;AudioVideo;'
}

package() {
  mkdir -p "$pkgdir/usr/share"
  cp -r "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/share/spcplay"
  install -Dm755 "$srcdir/spcplay" "$pkgdir/usr/bin/spcplay"
  install -Dm644 "$srcdir/spcplay.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/x-spc.xml" "$pkgdir/usr/share/mime/application/x-spc.xml"
}
