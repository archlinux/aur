# Maintainer: Samuel Lando samuel.lando@aol.com
pkgname=pomodoro
pkgver=r6.06b5346
pkgrel=1
pkgdesc="Time tool."
arch=('any')
url="http://samuellando.com"
license=('GPL')
makedepends=('git')
optdepends=()
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname::git+https://github.com/samuellando/pomodoro.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  rm -r ${srcdir}/$pkgname/pomodoro.info.def
  mkdir -p ${pkgdir}/usr/bin
  cp ${srcdir}/$pkgname/* ${pkgdir}/usr/bin/
}
