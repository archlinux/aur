# Maintainer: aksr <aksr at t-com dot me>
pkgname=repassgen-git
pkgver=r57.4c252f4
pkgrel=1
epoch=
pkgdesc="A super-flexible random password generator based on a regexp-like pattern."
arch=('i686' 'x86_64')
url="https://github.com/ilius/repassgen"
license=('LGPL3')
groups=()
depends=()
makedepends=('git' 'go')
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=
noextract=()
_gourl=github.com/ilius/repassgen

pkgver() {
  GOPATH="$srcdir" go get -d ${_gourl}
  cd "$srcdir/src/${_gourl}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  GOPATH="$srcdir" go get -fix -v ${_gourl}
}

check() {
  GOPATH="$srcdir" go test -v -x ${_gourl}
}

package() {
  cd "$srcdir"
  install -D -m755 bin/repassgen "$pkgdir/usr/bin/repassgen"
  install -D -m644 src/${_gourl}/README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -D -m644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

