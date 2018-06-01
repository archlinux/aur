# Maintainer: aksr <aksr at t-com dot me>
pkgname=singlepage-git
pkgver=r13.0ee88de
pkgrel=1
epoch=
pkgdesc="Bundle external assets in a HTML file to distribute a stand-alone HTML document. "
arch=('i686' 'x86_64')
url="https://github.com/Carpetsmoker/singlepage"
license=('MIT')
categories=()
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
_gourl=arp242.net/singlepage

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
  install -Dm755 bin/singlepage "$pkgdir/usr/bin/singlepage"
  install -Dm644 src/${_gourl}/README.markdown $pkgdir/usr/share/doc/${pkgname%-*}/README.markdown
  install -Dm644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

