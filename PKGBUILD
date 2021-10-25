# Maintainer: Stanislav <monesonn@tuta.io>

pkgname='doasedit-git'
pkgver=r15.7a37709
pkgrel=1
pkgdesc='A POSIX shell script that implements the sudoedit functionality for doas utility.'
arch=('any')
url='https://github.com/monesonn/doasedit'
license=('ISC')
depends=('opendoas')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=('doasedit')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 ./doasedit "${pkgdir}/usr/local/bin/doasedit"
  install -Dm644 ./license "${pkgdir}/usr/share/licenses/doasedit/LICENSE"
}

# vim: ft=sh ts=2 sw=2 et
