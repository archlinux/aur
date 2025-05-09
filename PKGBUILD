# Maintainer: Andrew Whatson <whatson@gmail.com>
# Contributor: Glen D'souza <gdsouza@linuxmail.org>
# Contributor: jmf <jmf at mesecons dot net>
# Contributor: Pascal Groschwitz <p.groschwitz@googlemail.com>

pkgname=flightgear-data-git
pkgver=2024.2.0r10907.462fd76a7
pkgrel=1
pkgdesc="Base data for the flightgear flight simulator."
arch=('any')
url="https://www.flightgear.org/"
options=(!strip)
license=('GPL')
makedepends=('git')
provides=("flightgear-data=${pkgver}")
conflicts=('flightgear-data')
source=("flightgear-data::git+https://gitlab.com/flightgear/fgdata.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/flightgear-data
  printf "%sr%s.%s" \
    "$(tr -d '\n' < version)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "$pkgdir"/usr/share/flightgear
  mv "$srcdir"/flightgear-data "$pkgdir"/usr/share/flightgear/data
}
