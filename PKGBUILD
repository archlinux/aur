# Contributor: WoefulDerelict <WoefulDerelict at GMail dot com>

pkgname=cdbus-git
pkgver=r28.dd9f112
pkgrel=1
pkgdesc="libdbus helper library (in plain C)."
arch=('x86_64')
url="https://gitea.ladish.org/LADI/cdbus"
license=('GPL2' 'custom:AFL2.1')
depends=('dbus')
makedepends=('git' 'python')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+https://gitea.ladish.org/LADI/cdbus.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${pkgname%-*}"
  ./waf configure --prefix=/usr
  ./waf
}

package() {
  cd "${pkgname%-*}"
  ./waf install --destdir="${pkgdir}"
#  While they are referenced in COPYING the repository is currently missing the license files.
#  install -Dm644 afl21.txt "$pkgdir/usr/share/licenses/$pkgname/AFL-2.1.txt"
}
