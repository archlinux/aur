# Maintainer: FraV1982 <consulenza.vangi@libero.it>

pkgname=pearson-reader-plus-it
pkgver=4.7
pkgrel=1
pkgdesc="A simple Reader for Pearson digital books (IT)."
arch=('x86_64')
url="https://it.pearson.com/"
license=('custom')
depends=('sdl2' 'unzip' 'tar')
optdepends=(
'chromium: a modern browser for the application to work'
'firefox: a modern browser for the application to work'
'google-chrome: a modern browser for the application to work'
'evince: a pdf viewer'
'epdfview: a pdf viewer'
'qpdfview: a pdf viewer'
'mupdf: a pdf viewer'
)
options=(!strip)

_debname=B300361C

source=(https://link.pearson.it/B300361C)
md5sums=('SKIP')
sha256sums=('SKIP')

prepare() {
  sudo mkdir /opt/rplus-desktop
  cd "$srcdir"
  msg2 "Decompressing Debian package..."
  ar xv "${_debname}" > /dev/null
  tar -xf data.tar.gz > /dev/null

  #find ./{etc,usr} -type d -exec chmod 755 '{}' \;
  find ./opt -type d -exec chmod 755 '{}' \;
  sudo chmod 755 /opt/rplus-desktop
}

package() {
  cd "$srcdir"
  #cp -dpr --no-preserve=ownership {opt,usr} "$pkgdir"
  cp -dpr --no-preserve=ownership ./opt "$pkgdir"
  cd "$pkgdir"
  wget https://play-lh.googleusercontent.com/3KW5AwB-IqviZEDpHfaHXoBnt0hBNJHByV7TRLkcYukPjupTXva0qWlmazXx_bFxMEZT
  cd /tmp
  sudo wget http://mirror.fourtech.ml/pearson-reader-plus-it/ReaderPlus.desktop
  sudo cp -dpr --no-preserve=ownership ReaderPlus.desktop /usr/share/applications
}
  
