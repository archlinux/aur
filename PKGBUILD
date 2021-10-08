# Maintainer: max.bra <max dot bra at alice dot it>

pkgname=hub-young
pkgver=5.6.253
pkgrel=1
pkgdesc="La piattaforma facile, gratuita e innovativa per la didattica digitale."
arch=('x86_64')
url="https://www.hubscuola.it/download-app"
license=('unknown')
depends=('sdl2' 'unzip')
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

_debname=HUB-Young.deb

source=(https://bce.mondadorieducation.it/media_educar/contenuti/appdilettura/younglinux.zip)
sha256sums=('63b292ae5797c8434bae7512c416a7b5d749caf611a3657e012d272319b9ef4c')

prepare() {
  cd "$srcdir"
  msg2 "Decompressing Debian package..."
  ar xv "${_debname}" > /dev/null
  tar -xf data.tar.xz > /dev/null

  #find ./{etc,usr} -type d -exec chmod 755 '{}' \;
  find ./usr -type d -exec chmod 755 '{}' \;
  chmod 755 ./usr/local/bin/hubyoung/hub-young
}

package() {
  cd "$srcdir"
  #cp -dpr --no-preserve=ownership {opt,usr} "$pkgdir"
  cp -dpr --no-preserve=ownership ./usr "$pkgdir"
}
