# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=automedia-git
pkgver=r194.1c96d1b
pkgrel=1
pkgdesc='Automatically track new releases of media and download them. Supports torrents using rss (nyaa.si) and manga sites using html.'
arch=('x86_64')
url="https://git.dec05eba.com/AutoMedia"
license=('GPL-3.0-only')
makedepends=('musl')
depends=('python' 'python-lxml' 'python-requests' 'curl' 'transmission-cli')
optdepends=('libnotify')
provides=('automedia')
conflicts=('automedia')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/AutoMedia.git.${pkgver}.tar.gz")
sha512sums=('edf75b918fc533f505378567e406c6b3e62477b39a6bc42edccc0f0042a8396096e65272060a1934f2f9cac5619baea80b079570145cfeb5e4bd2d58d036756c')

package() {
  cd "$srcdir"
  ./release.sh
  install -Dm755 "automedia" "$pkgdir/usr/bin/automedia"
  for file in plugins/*; do
    install -Dm755 "$file" "$pkgdir/usr/share/automedia/$file"
  done
  install -Dm755 "fallback.json" "$pkgdir/usr/share/automedia/fallback.json"
}
