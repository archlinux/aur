# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=automedia
pkgver=r205.9763f86
pkgrel=1
pkgdesc='Automatically track new releases of media and download them. Supports torrents using rss (nyaa.si) and manga sites using html.'
arch=('x86_64')
url="https://git.dec05eba.com/AutoMedia"
license=('GPL-3.0-only')
depends=('python' 'python-lxml' 'python-requests' 'curl' 'transmission-cli')
optdepends=('libnotify')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/AutoMedia.git.${pkgver}.tar.gz")
sha512sums=('87926dba48b06a5bda1ba43735ad29364e0cf5915abd55a42c261ebe427e7bffd61775bb0286c1a246eec04ca58281181bedf86c2d09b31b592264d45fd0ab88')

build() {
  cd "$srcdir"
  ./release.sh
}

package() {
  cd "$srcdir"
  install -Dm755 "automedia" "$pkgdir/usr/bin/automedia"
  for file in plugins/*; do
    install -Dm755 "$file" "$pkgdir/usr/share/automedia/$file"
  done
  install -Dm755 "fallback.json" "$pkgdir/usr/share/automedia/fallback.json"
}
