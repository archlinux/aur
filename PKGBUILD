# Maintainer: aksr <aksr at t-com dot me>
pkgname=nash-git
pkgver=r444.5a9bdb1
pkgrel=1
epoch=
pkgdesc="A system shell that attempts to be more safe and give more power to user."
arch=('i686' 'x86_64')
url="https://github.com/NeowayLabs/nash"
license=('apache')
categories=()
groups=()
depends=('')
makedepends=('git' 'go')
optdepends=()
checkdepends=()
provides=()
conflicts=('')
replaces=()
backup=()
options=()
changelog=
install=
noextract=()
_gourl=github.com/NeowayLabs/nash/cmd/nash

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
  install -Dm755 bin/nash "$pkgdir/usr/bin/nash"
  install -Dm644 src/${_gourl%/*/*}/README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 src/${_gourl%/*/*}/examples/init $pkgdir/usr/share/doc/${pkgname%-*}/examples/init
  install -Dm644 src/${_gourl%/*/*}/LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE

}

