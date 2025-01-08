# Maintainer: Frederik Leonhardt <frederik at leonhardt dot co dot nz>
pkgname=bluebrick
pkgver=1.9.2
pkgrel=1
pkgdesc="BlueBrick Lego Layout Planer"
arch=('x86_64')
url="https://bluebrick.lswproject.com"
license=('GPL-3.0-only')
depends=('mono')
optdepends=('xchm: to read the documentation')
options=(!strip)
source=("$pkgname-$pkgver.zip::https://bluebrick.lswproject.com/download/BlueBrick.${pkgver}.zip"
        "$pkgname.desktop"
        "$pkgname.xml")
sha256sums=('4e0682a9083b4026cbf2a03e71dc9e8b3865cc72e3beac65c299197c7e492847'
            '3ef1c6c69ee75a4f4044197c8c38a7a739c5ab3b190aab579f6a29433ef88f5f'
            '881df2737967036622ab829035de0d52e9e65bcba867cd5da69bed5206369072')

package() {

  install -Dd "$pkgdir/opt/$pkgname"

  # The parts library folder and global config file locations are not configurable,
  # and need to be writable for the user running the program.
  install -dm757 "$pkgdir/opt/$pkgname/parts"
  install -m666 "$srcdir/BlueBrick.exe.config" "$pkgdir/opt/$pkgname/"

  # The remaining files can be taken from the distribution.
  local item
  local files=(
    config/
    icons/
    parts/
    BlueBrick.chm
    BlueBrick.exe
    ReadMe.txt
  )
  for item in "${files[@]}" ; do
    cp -r "$srcdir/$item" "$pkgdir/opt/$pkgname/"
  done

  # Meta: desktop and mimetypes.
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname.xml" "$pkgdir/usr/share/mime/packages/$pkgname.xml"
}

