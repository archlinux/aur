# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=automedia-git
pkgver=r189.7576027
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
sha512sums=('61e5b4bde1f333f6f35b466296f450bfb9dff52f2050ce332eadd34e7905b68a3d494931fd23cd0899af2952efb654510b3e9a918db7d05bb059347fa6418549')

package() {
  cd "$srcdir"
  ./release.sh
  install -Dm755 "automedia" "$pkgdir/usr/bin/automedia"
  for file in plugins/*; do
    install -Dm755 "$file" "$pkgdir/usr/share/automedia/$file"
  done
}
