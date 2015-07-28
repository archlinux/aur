# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: Erdbeerkaese
# Contributor: Arkham <arkham at archlinux dot us>

pkgname=slingshot
pkgver=0.8.1p
pkgrel=7
pkgdesc="A 2D strategy game in the gravity fields of several planets"
arch=('any')
url="http://slingshot.wikispot.org"
license=('GPL')
depends=('python2-pygame')
source=(http://downloads.sourceforge.net/$pkgname-game/Slingshot-$pkgver-linux.tar.gz
        $pkgname.sh
        $pkgname.patch)
md5sums=('cdfcf0c85dc7d1b203344c24f591e7b5'
         '38bb1952740a5780dda0b1ea32b933aa'
         'acf36309734e5357a5a641ea6bc415cf')

build() {
  cd "$srcdir"/Slingshot-$pkgver-linux

  tar -xzf "$pkgname"_files.tar.gz

  patch -Np1 -i "$srcdir"/$pkgname.patch
}

package() {
  cd "$srcdir"/Slingshot-$pkgver-linux

  install -dm755 "$pkgdir"/usr/share/$pkgname/data/

  for file in "$pkgname"/*.py ; do
    install -Dm644 "$file" "$pkgdir"/usr/share/$pkgname/
  done

  for file in "$pkgname"/data/* ; do
    install -Dm644 "$file" "$pkgdir"/usr/share/$pkgname/data/
  done

  install -Dm644 readme "$pkgdir"/usr/share/doc/$pkgname/readme
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm755 "$srcdir"/$pkgname.sh "$pkgdir"/usr/bin/$pkgname
}
