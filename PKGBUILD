# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=automedia
pkgver=r195.84ffcb8
pkgrel=1
pkgdesc='Automatically track new releases of media and download them. Supports torrents using rss (nyaa.si) and manga sites using html.'
arch=('x86_64')
url="https://git.dec05eba.com/AutoMedia"
license=('GPL-3.0-only')
depends=('python' 'python-lxml' 'python-requests' 'curl' 'transmission-cli')
optdepends=('libnotify')
provides=('automedia')
conflicts=('automedia')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/AutoMedia.git.${pkgver}.tar.gz")
sha512sums=('3392e12361eab90049cc8f8c4a115010cfd92370f856f3f1280aa326b55d3d9f9eea084ff9d9d03777304be4cc12d5fb2421ef8fe8098a0f313f84eb06e29b43')

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
