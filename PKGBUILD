# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=automedia-git
pkgver=r103.14d0e43
pkgrel=1
pkgdesc='Automatically track new releases of media and download them. Supports torrents using rss (nyaa.si) and manga sites using html.'
arch=('any')
url="https://git.dec05eba.com/AutoMedia"
license=('GPL3')
makedepends=('git')
depends=('python' 'python-lxml' 'python-requests' 'python-protobuf' 'curl' 'transmission-cli')
optdepends=('libnotify')
provides=('automedia')
conflicts=('automedia')
source=("git+https://git.dec05eba.com/AutoMedia#branch=c_version")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/AutoMedia"
  printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/AutoMedia"
  install -Dm755 "automedia" "$pkgdir/usr/bin/automedia"
  for file in plugins/*; do
    install -Dm755 "$file" "$pkgdir/usr/share/automedia/$file"
  done
}
