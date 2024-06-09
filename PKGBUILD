# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=automedia-git
pkgver=r191.b3ef5d2
pkgrel=1
pkgdesc='Automatically track new releases of media and download them. Supports torrents using rss (nyaa.si) and manga sites using html.'
arch=('x86_64')
url="https://git.dec05eba.com/AutoMedia"
license=('GPL3')
makedepends=('musl')
depends=('python' 'python-lxml' 'python-requests' 'curl' 'transmission-cli')
optdepends=('libnotify')
provides=('automedia')
conflicts=('automedia')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/AutoMedia.git.${pkgver}.tar.gz")
sha512sums=('df0ecbd9faea179c8c9f90991d9dee46b79b5d84ba3e66b4d7852b75da44298e9556d9c87868fcd24064f8905f46ab3acff1dfdb28f629a29ca77a3547223232')

package() {
  cd "$srcdir"
  ./release.sh
  install -Dm755 "automedia" "$pkgdir/usr/bin/automedia"
  for file in plugins/*; do
    install -Dm755 "$file" "$pkgdir/usr/share/automedia/$file"
  done
}
