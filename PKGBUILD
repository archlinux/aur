# Maintainer: Lars Hupel <lars@hupel.info>
# Contributor: Ramana Kumar <firstname|@|member.fsf.org>
pkgname=opentheory-git
pkgver="1.3.r1493.45d7d5e5"
_basever="1.3"
pkgrel=2
pkgdesc="a tool for processing higher-order logic theory packages"
arch=('x86_64')
url="http://www.gilith.com/software/opentheory"
license=('MIT')
groups=()
depends=()
makedepends=(mlton git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('opentheory::git+https://github.com/gilith/opentheory.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "${_basever}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make init
}

check() {
  cd "$srcdir/${pkgname%-git}"
  make mlton
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp -p "$srcdir/${pkgname%-git}/bin/mlton/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
}

# vim:set ts=2 sw=2 et:
