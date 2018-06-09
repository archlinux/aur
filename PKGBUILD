# Maintainer:  Quint Guvernator <quint@guvernator.net>

pkgname=hp15c
pkgver=4.0.0
pkgrel=1
pkgdesc="A simulator for the HP-15C programmable scientific RPN calculator"
url="http://hp-15c.homepage.t-online.de/content_web.htm"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('tcl' 'tk')
source=("$pkgname-$pkgver.zip::https://drive.google.com/uc?export=download&id=1ewFXi6PPRsiPJESUq5A2Gp83NYSYVYKr")
md5sums=('c90cc630d9e5bdf70912f8cd754cc2cc')

prepare() {
  # patch location of help files to match Arch standards
  patch -p1 -i '../01-hp15c-arch-docs.patch'
}

package() {

  # docs
  mkdir -p "$pkgdir/usr/share/doc/"
  cp -r doc "$pkgdir/usr/share/doc/$pkgname"
  cp -r progs -t "$pkgdir/usr/share/doc/$pkgname/"
  cp "Read Me & Release Notes.html" "$pkgdir/usr/share/doc/$pkgname/README.html"

  # dependencies of script
  mkdir -p "$pkgdir/usr/lib/$pkgname/"
  cp -r css icons lib msgs -t "$pkgdir/usr/lib/$pkgname/"
  install -Dm644 HP-15C_Simulator_Font.ttf -t "$pkgdir/usr/share/fonts/"

  # runs script in proper directory
  cp HP-15C.tcl -t "$pkgdir/usr/lib/$pkgname/"
  install -D ../hp15c_runner.sh "$pkgdir/usr/bin/hp15c"
}
# vim:set ts=2 sw=2 ft=sh et:
