# Maintainer: Alexander Rødseth <rodseth@gmail.com>
pkgname=aut2exe
pkgver=3.3.6.1
pkgrel=3
pkgdesc="AutoIt compiler (from au3 to exe)"
arch=('any')
url="http://www.autoitscript.com/"
license=('custom')
depends=('wine')
makedepends=('p7zip')
optdepends=('aut2exe-docs: help files and sample code')
md5sums=('a285f2a980d258fc1f095d12ada885e3'
         '1bc07254a7e54c7e91d8340b87860270'
         '4b9636dd42c12a66b586da8daf25c20c')
source=("http://www.autoitscript.com/cgi-bin/getfile.pl?autoit3/autoit-v3-sfx.exe"
        "http://www.autoitscript.com/autoit3/docs/license.htm"
        "aut2exe.sh")

build() {
  cd "$srcdir"

  msg2 "Extracting..."
  7z x autoit-v3-sfx.exe > /dev/null
  mv install "$pkgname"
}

package() {
  cd "$srcdir/$pkgname/Aut2Exe"

  msg2 "Packaging executables..."
  install -Dm644 Aut2exe.exe "$pkgdir/usr/bin/Aut2exe.exe"
  install -Dm644 AutoItSC.bin "$pkgdir/usr/bin/AutoItSC.bin"
  install -Dm644 upx.exe "$pkgdir/usr/bin/upx.exe"
  install -Dm755 "$srcdir/aut2exe.sh" "$pkgdir/usr/bin/aut2exe"

  msg2 "Packaging license..."
  install -Dm644 "$srcdir/license.htm" \
    "$pkgdir/usr/share/licenses/$pkgname/license.html"
}
# vim:set ts=2 sw=2 et:
