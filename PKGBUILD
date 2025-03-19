# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=automedia
pkgver=r201.2e148f2
pkgrel=1
pkgdesc='Automatically track new releases of media and download them. Supports torrents using rss (nyaa.si) and manga sites using html.'
arch=('x86_64')
url="https://git.dec05eba.com/AutoMedia"
license=('GPL-3.0-only')
depends=('python' 'python-lxml' 'python-requests' 'curl' 'transmission-cli')
optdepends=('libnotify')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/AutoMedia.git.${pkgver}.tar.gz")
sha512sums=('644899c7a2528577cc1cdd33ba719abfd679837eb8721197872dd660b2b4a266b9790db160aa777ee01fdcd29f59329f932c7f177b8a11e8c97da7f5caab2a23')

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
