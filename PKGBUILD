# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=opentyrian
pkgver=2.1.20130907
pkgrel=1
pkgdesc="Open Source port of the classic DOS shoot-em-up Tyrian"
url="https://bitbucket.org/opentyrian/opentyrian"
arch=('i686' 'x86_64')
license=('GPL')
install=$pkgname.install
provides=('tyrian')
depends=('sdl_net')
optdepends=('hicolor-icon-theme: .desktop file icons')
source=("http://camanis.net/$pkgname/releases/$pkgname-$pkgver-src.tar.gz"
        "http://camanis.net/tyrian/tyrian21.zip")
sha256sums=('f54b6b3cedcefa187c9f605d6164aae29ec46a731a6df30d351af4c008dee45f'
            '7790d09a2a3addcd33c66ef063d5900eb81cc9c342f4807eb8356364dd1d9277')

build() {
  make release -C $pkgname-$pkgver
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 linux/man/$pkgname.6 "$pkgdir"/usr/share/man/man6/$pkgname.6
  install -Dm644 linux/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 linux/icons/tyrian-48.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -d "$pkgdir"/usr/share/{opentyrian/data,doc/$pkgname}
  install -m644 {README,CREDITS} "$pkgdir"/usr/share/doc/$pkgname
  for _x in 22 24 32 48 128; do
    install -Dm644 "linux/icons/tyrian-$_x.png" \
      "$pkgdir"/usr/share/icons/hicolor/${_x}x${_x}/apps/$pkgname.png
  done

  cd ../tyrian21
  for _x in *.{dat,lvl,shp,snd,mus,anm} demo.* tyrian.{cdt,hdt,pic} tshp2.pcx;
  do
    install -m644 "$_x" "$pkgdir"/usr/share/opentyrian/data
  done
}
