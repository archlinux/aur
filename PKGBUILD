# Maintainer: 0x715C <https://www.t.me/hex715C>

pkgname=alda-git
_pkgname=alda
pkgver=1.2.0.r17.g2203edf
pkgrel=1
pkgdesc='A music programming language for musicians. 🎶'
arch=('x86_64')
url='https://github.com/alda-lang/alda'
license=('EPL')
provides=('alda')
conflicts=('alda')
#depends=('boot')
makedepends=('boot' 'launch4j')
#optdepends=()
options=('docs' '!strip' 'debug')
source=('git://github.com/alda-lang/alda')
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  mkdir -p bin
  sed -e 's/(exe :file file :output-dir output-dir)//g' -i build.boot
}

build() {
  cd "$srcdir/$_pkgname"
  boot build -o bin/
}

package() {
  cd "$srcdir/$_pkgname/bin"
  install -Dm755 alda \
    "${pkgdir}/usr/bin/${_pkgname}"
}
