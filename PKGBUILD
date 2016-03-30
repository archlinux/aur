# Maintainer: AlexanderR <rvacheva at nxt dot ru>

pkgname=donttakeitpersonally
pkgver=1.1
pkgrel=3
pkgdesc="'don't take it personally, babe, it just ain't your story' is a visual novel game that tells a story of a new high school literature teacher, set in a prestigious private high school, and on the social networks of 2027."
arch=('any')
url='http://scoutshonour.com/donttakeitpersonallybabeitjustaintyourstory/'
license=('CCPL:by-nc-sa')
depends=('renpy')
changelog=ChangeLog
source=("http://scoutshonour.com/donttakeitpersonallybabeitjustaintyourstory/don't%20take%20it%20personally,%20babe-$pkgver-linux-x86.tar.bz2"
        "${pkgname}.sh"
	"${pkgname}.desktop"
	"${pkgname}.ico"
	'python2.patch')

build() {
  cd "$srcdir/don't take it personally, babe-$pkgver-linux-x86"
  
  patch -p1 -i ../python2.patch
}

package() {
  cd "$srcdir/don't take it personally, babe-$pkgver-linux-x86"

  # copy main files
  install -dm755 "$pkgdir/usr/share/$pkgname"
  cp -r game/* "$pkgdir/usr/share/$pkgname"
  install -m644 "don't take it personally, babe.py" "$pkgdir/usr/share/$pkgname"

  # copy game readme
  install -D -m644 'README.html' "$pkgdir/usr/share/doc/$pkgname/README.html"

  # copy bash script
  install -D -m755 "$srcdir/${pkgname}.sh" "$pkgdir/usr/bin/$pkgname"

  # install desktop entry file
  install -D -m644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "$srcdir/${pkgname}.ico" "$pkgdir/usr/share/pixmaps/${pkgname}.ico"
}

md5sums=('ffd57c51b7bfbc28170f0a4044b1cff1'
         '6d2a8b1da2b23cc60722814a85afabe4'
         '08d0bb8fe6f3082eb7248b08f0d13e59'
         '25a48bd6b230d4d92c24fd34c9a8b43f'
         'ecf6ab36828622e108d87ce931a54677')

# vim:set ts=2 sw=2 et:
