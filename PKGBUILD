# Maintainer: Samuel Lando samuel.lando@aol.com
pkgname=pomodoro
pkgver=r22.41b74d5
pkgrel=1
pkgdesc="Time tool."
arch=('any')
url="http://samuellando.com"
license=('GPL')
makedepends=('git')
optdepends=()
provides=("$pkgname")
conflicts=("$pkgname")
_commit="41b74d5fc6f002bb87e2a69f36407a40662cd3cc"
source=("$pkgname::git+https://github.com/samuellando/pomodoro.git#commit=${_commit}")
md5sums=('SKIP')
depends=('dmenu')

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
