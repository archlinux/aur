# Maintainer: Samuel Lando samuel.lando@aol.com
pkgname=pomodoro
pkgver=r16.6a7cbb5
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
  config=${pkgdir}/usr/share/doc/pomodoro
  bin=${pkgdir}/usr/bin
  man=${pkgdir}/usr/local/man/man1
  mkdir -p $config
  mkdir -p $bin
  mkdir -p $man
  cp ${srcdir}/$pkgname/pomodoro $bin
  cp ${srcdir}/$pkgname/config.def $config
  cp ${srcdir}/$pkgname/man/pomodoro.1 $man
  gzip $man/pomodoro.1 
}
