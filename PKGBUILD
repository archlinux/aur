# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=automedia
pkgver=r204.a700c5d
pkgrel=1
pkgdesc='Automatically track new releases of media and download them. Supports torrents using rss (nyaa.si) and manga sites using html.'
arch=('x86_64')
url="https://git.dec05eba.com/AutoMedia"
license=('GPL-3.0-only')
depends=('python' 'python-lxml' 'python-requests' 'curl' 'transmission-cli')
optdepends=('libnotify')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/AutoMedia.git.${pkgver}.tar.gz")
sha512sums=('05c22d2072e3ec8e14e19cedfe70c094dcd8a7a3cc17158d9f41148d78d52d201f008086629cafd944669739935c39d51c616d7e76c4263b5e5db2f90fe1de7a')

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
