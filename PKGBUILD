# Maintainer: Yves G. <theYinYeti@yalis.fr>

pkgname=simple-sso-git
pkgver=0.alpha
pkgrel=2
pkgdesc="Simple Single Sign-On written in LUA and embedded into Nginx, using the OpenResty environment"
arch=(any)
url="https://yalis.fr/git/yves/simple-sso"
license=('GPL')
depends=(openresty)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=()
options=()
install=
source=('simple-sso::git+https://yalis.fr/git/yves/simple-sso.git#branch=develop')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  # Git, tags available
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

  # Git, no tags available
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  :
}

build() {
  :
}

check() {
  :
}

package() {
  local etcdest="$pkgdir/etc/nginx/ssso"
  local usrdest="$pkgdir/usr/share/doc/${pkgname%-git}"

  cd "$srcdir/${pkgname%-git}"
  mkdir -p "$etcdest/sites" "$usrdest"

  cp    src/*.lua                  "$etcdest/"
  cp -r doc/samples/{login,portal} "$etcdest/"
  cp -r doc/* README.md            "$usrdest/"
}
