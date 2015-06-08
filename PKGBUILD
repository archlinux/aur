# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: AlexanderR <alexander r at gmx com>

pkgname=junipersknot
pkgver=1.0
pkgrel=4
pkgdesc="A short kinetic novel crafted in a month by Dischan, Juniper's Knot is a story told from dual perspectives: that of a demon and a boy."
arch=('any')
url="http://junipersknot.dischan.org/"
license=('custom')
depends=('renpy')
options=(!strip)
source=("JunipersKnot_en_1.0_lin.tar.bz2::https://dischan.org/store/download.php?fileID=14"
	dischan_JunipersKnot.desktop
	python2.patch
	junipersknot
	junipersknot.png)
md5sums=('3318de6e4c5952271961d757bdd5fddf'
         '672677a075b4ed04f4a3ca71f6c33808'
         'd00783636657a37728c48b8ce295cc93'
         '6b294591761f99d780a8e4d64848aba2'
         '4c498a2152c46fbe993711eaeb91f48e')

build() {
  cd "$srcdir/Juniper's Knot-linux-x86"
  patch -Np1 -i "$srcdir/python2.patch"
}

package() {
  cd "$srcdir/Juniper's Knot-linux-x86"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -m644 README.txt SOUNDCREDITS.txt "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm755 "$srcdir"/${pkgname} "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 "Juniper's Knot.py" "$pkgdir/usr/share/$pkgname/Juniper's Knot.py"
  install -Dm644 DISCHANLICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/DISCHANLICENSE.txt"
  install -Dm644 "$srcdir/junipersknot.png" "$pkgdir/usr/share/pixmaps/junipersknot.png"
  install -Dm644 "$srcdir/dischan_JunipersKnot.desktop" "$pkgdir/usr/share/applications/dischan_JunipersKnot.desktop"
  cp -r game/* "$pkgdir/usr/share/$pkgname"
}
