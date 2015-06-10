# Maintainer: Alexander Rødseth <rodseth@gmail.com>
pkgname=aut2exe-docs
pkgver=3.3.6.1
pkgrel=2
pkgdesc="AutoIt documentation"
arch=('any')
url="http://www.autoitscript.com/"
license=('custom')
depends=('xchm')
makedepends=('p7zip')
optdepends=('aut2exe: au3 to exe compiler')
source=("http://www.autoitscript.com/cgi-bin/getfile.pl?autoit3/autoit-v3-sfx.exe"
        "http://www.autoitscript.com/autoit3/docs/license.htm"
        "aut2exe_help.sh")
md5sums=('a285f2a980d258fc1f095d12ada885e3'
         '1bc07254a7e54c7e91d8340b87860270'
         'abf275d17c7d5617d62723acd14af5c5')

build() {
  cd "$srcdir"

  msg2 "Extracting..."
  7z x autoit-v3-sfx.exe > /dev/null
  mv install "$pkgname"
}

package() {
  cd "$srcdir/$pkgname"

  msg2 "Packaging script..."
  install -Dm755 "$srcdir/aut2exe_help.sh" "$pkgdir/usr/bin/aut2exe_help"

  msg2 "Packaging documentation..."
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 AutoIt.chm "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 AutoIt3.chm "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 UDFs3.chm "$pkgdir/usr/share/doc/$pkgname"

  msg2 "Packaging examples..."
  cp -r "$srcdir/$pkgname/Examples" \
    "$pkgdir/usr/share/doc/$pkgname/examples"
  find "$pkgdir/usr/share/doc/$pkgname" -type d -exec chmod 755 {} \;

  msg2 "Packaging license..."
  install -Dm644 "$srcdir/license.htm" \
    "$pkgdir/usr/share/licenses/$pkgname/license.html"
}
# vim:set ts=2 sw=2 et:
