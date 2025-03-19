# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=automedia
pkgver=r200.5409de3
pkgrel=1
pkgdesc='Automatically track new releases of media and download them. Supports torrents using rss (nyaa.si) and manga sites using html.'
arch=('x86_64')
url="https://git.dec05eba.com/AutoMedia"
license=('GPL-3.0-only')
depends=('python' 'python-lxml' 'python-requests' 'curl' 'transmission-cli')
optdepends=('libnotify')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/AutoMedia.git.${pkgver}.tar.gz")
sha512sums=('81d463c407780c93d913ae1b8103e6b43cda8a0d351b036f8519dd762b56f3bda23f752549b27851f7cdc3be1fb13d1d45a8f411e674a56bd7a7f8336c9a460d')

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
