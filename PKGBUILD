# Maintainer: max.bra <max dot bra at alice dot it>

pkgname=hub-kids
pkgver=6.2.291
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

_debname=HUB-Kids.deb

source=(https://bce.mondadorieducation.it/media_educar/contenuti/appdilettura/kidslinux.zip)
sha256sums=('3a25e2e3ebcf018e147423067a89dd24fd55b1ec8b09e67f66ab4a6324f54e54')

prepare() {
  cd "$srcdir"
  msg2 "Decompressing Debian package..."
  ar xv "${_debname}" > /dev/null
  tar -xf data.tar.zst > /dev/null

  #find ./{etc,usr} -type d -exec chmod 755 '{}' \;
  find ./usr -type d -exec chmod 755 '{}' \;
  chmod 755 ./usr/local/bin/hubkids/hub-kids
}

package() {
  cd "$srcdir"
  #cp -dpr --no-preserve=ownership {opt,usr} "$pkgdir"
  cp -dpr --no-preserve=ownership ./usr "$pkgdir"
}
