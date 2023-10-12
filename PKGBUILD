# Contributor: WoefulDerelict <WoefulDerelict at GMail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=laditools-git
pkgver=1.1.r6.g61f59ae
pkgrel=1
pkgdesc="Utilities to improve integration and workflow with JACK and LASH."
arch=('any')
url="https://gitea.ladish.org/LADI/laditools"
license=('GPL3')
depends=('gtk3' 'ladish' 'python' 'python-gobject' 'python-pyxdg' 'python-yaml')
makedepends=('git' 'glade' 'python-distutils-extra')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+https://gitea.ladish.org/LADI/laditools.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${pkgname%-*}"
  python setup.py build
}

package() {
  cd "${pkgname%-*}"
  python setup.py install --prefix=/usr --root="${pkgdir}/"
}
