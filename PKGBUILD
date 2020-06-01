# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Juan Pablo Gonzalez Tognarelli <lord_jotape@yahoo.com.ar>

pkgname=uriparser
pkgver=0.9.4
pkgrel=1
pkgdesc='uriparser is a strictly RFC 3986 compliant URI parsing library. uriparser is cross-platform, fast, supports Unicode'
url='https://github.com/uriparser/uriparser'
makedepends=('cmake')
arch=('x86_64')
license=('custom')
source=("https://github.com/uriparser/uriparser/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('c2554f555bb1640aa5d77e574966d203ab073d738366d90ec5ada0055cd05bf7')

build() {
  mkdir "$srcdir"/build
  cd "$srcdir"/build
  
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DURIPARSER_BUILD_DOCS=OFF \
    -DURIPARSER_BUILD_TESTS=OFF \
    "$srcdir"/$pkgname-$pkgver
  make
}

package() {
  cd "$srcdir"/build

  make DESTDIR="$pkgdir" install
  install -D -m0644 "$srcdir"/$pkgname-$pkgver/COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
