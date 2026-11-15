# Maintainer: Andrew Whatson <whatson@gmail.com>
# Contributor: Glen D'souza <gdsouza@linuxmail.org>
# Contributor: jmf <jmf at mesecons dot net>
# Contributor: Pascal Groschwitz <p.groschwitz@googlemail.com>

pkgname=flightgear-data-git
pkgver=2024.2.0r11194.79d6c9f5a
pkgrel=1
pkgdesc="Base data for the flightgear flight simulator."
arch=('any')
url="https://gitlab.com/flightgear/fgdata"
license=('GPL-2.0-or-later')
depends=('bash' 'perl' 'python')
makedepends=('git')
provides=("flightgear-data=${pkgver}")
conflicts=('flightgear-data')
options=(!strip)
source=("flightgear-data::git+https://gitlab.com/flightgear/fgdata.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/flightgear-data
  printf "%sr%s.%s" \
    "$(tr -d '\n' < version)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  install -d "$pkgdir"/usr/share/flightgear/data
  # Copy the working tree but not the .git directory.
  cp -r "$srcdir"/flightgear-data/. "$pkgdir"/usr/share/flightgear/data/
  rm -rf "$pkgdir"/usr/share/flightgear/data/.git
}
