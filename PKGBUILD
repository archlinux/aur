# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=automedia-git
pkgver=r66.fc394eb
pkgrel=1
pkgdesc='Automatically track new releases of media and download them. Supports torrents using rss (nyaa.si) and manga sites using html.'
arch=('any')
url="https://git.dec05eba.com/AutoMedia"
license=('GPL3')
depends=('python' 'python-feedparser' 'python-transmissionrpc' 'python-lxml' 'python-requests' 'python-protobuf' 'transmission-cli')
optdepends=('libnotify')
provides=('automedia')
conflicts=('automedia')
source=("git+https://git.dec05eba.com/AutoMedia")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/AutoMedia"
  printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/AutoMedia"
  install -Dm755 "automedia" "$pkgdir/usr/bin/automedia"
  install -Dm755 "automedia.py" "$pkgdir/usr/share/automedia/automedia.py"
  install -Dm755 "domain.py" "$pkgdir/usr/share/automedia/domain.py"
  for file in plugins/*; do
    install -Dm755 "$file" "$pkgdir/usr/share/automedia/$file"
  done
}
