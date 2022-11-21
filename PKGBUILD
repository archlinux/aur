# Maintainer: Hyperdriveguy <hyperdriveguy@gmail.com>
pkgname=muse2pokecrystal
pkgver=1.0.0
pkgrel=1
pkgdesc="Convert MusicXML sheet music to the pokecrystal music macro format."
arch=('x86_64')
url='https://github.com/nephitejnf/muse2pokecrystal'
license=('AGPL')
depends=('python')
makedepends=('git')
optdepends=('musescore: Musescore palette import')
source=("${pkgname}"::'git+https://github.com/nephitejnf/muse2pokecrystal.git')
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  git checkout 0f3144f
}

package() {
  cd "$pkgname"

  mkdir -p $pkgdir/usr/lib/muse2pokecrystal
  mkdir -p $pkgdir/usr/share/muse2pokecrystal/docs
  mkdir -p $pkgdir/usr/share/man/man1
  mkdir -p $pkgdir/usr/bin

  cp -r src $pkgdir/usr/lib/muse2pokecrystal/src
  cp muse2pokecrystal.py $pkgdir/usr/lib/muse2pokecrystal/muse2pokecrystal.py

  cp docs/muse2pokecrystal.1 $pkgdir/usr/share/man/man1/muse2pokecrystal.1

  cp *.mpal $pkgdir/usr/share/muse2pokecrystal/
  cp *.musicxml $pkgdir/usr/share/muse2pokecrystal/
  cp *.ini $pkgdir/usr/share/muse2pokecrystal/

  cp docs/*.md $pkgdir/usr/share/muse2pokecrystal/docs/
  cp *.md $pkgdir/usr/share/muse2pokecrystal/docs/
  cp LICENSE* $pkgdir/usr/share/muse2pokecrystal/docs/

  echo "#!/bin/sh
  python /usr/lib/muse2pokecrystal/muse2pokecrystal.py" > $pkgdir/usr/bin/muse2pokecrystal

  chmod +x $pkgdir/usr/bin/muse2pokecrystal
}
