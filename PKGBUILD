# Maintainer: fossdd <fossdd@pwned.life>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Juan Pablo Gonzalez Tognarelli <lord_jotape@yahoo.com.ar>

_pkgname=uriparser
pkgname=$_pkgname-git
pkgver=r1053.70383a4
pkgrel=2
pkgdesc='uriparser is a strictly RFC 3986 compliant URI parsing library. uriparser is cross-platform, fast, supports Unicode'
url='https://github.com/uriparser/uriparser'
makedepends=('cmake')
arch=('x86_64')
license=('custom')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "$srcdir"/build
  cd "$srcdir"/build
  
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DURIPARSER_BUILD_DOCS=OFF \
    -DURIPARSER_BUILD_TESTS=OFF \
    "$srcdir"/$_pkgname
  make
}

package() {
  cd "$srcdir"/build

  make DESTDIR="$pkgdir" install
  install -D -m0644 "$srcdir"/$_pkgname/COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
