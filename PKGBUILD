# Maintainer: <zer0def on freenode>
pkgname=uts-server-git
pkgver=r290.8ec9955
pkgrel=1
pkgdesc="Micro RFC 3161 Time-Stamp server written in C."
arch=('i686' 'x86_64')
url="https://github.com/kakwa/uts-server"
license=('MIT')
depends=('openssl')
makedepends=('cmake' 'git' 'linux-headers')
provides=('uts-server')
conflicts=('uts-server')
source=("$pkgname::git+https://github.com/kakwa/uts-server")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  cmake -DBUNDLE_CIVETWEB=ON
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
