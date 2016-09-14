# Maintainer: siers <wimuan@gmail.com>
# vim: ts=2 sw=2
pkgname=massren
pkgver=20160913
pkgrel=1
pkgdesc="Bash wrapper for pacman and aur"
pkgdesc="Easily rename multiple files using your text editor"
url="https://github.com/laurent22/massren"
license=("MIT")
arch=('any')
makedepends=('git' 'go')
depends=()
optdepends=()
source=()
md5sums=()

build() {
  export GOPATH="$srcdir"
  export GOBIN="$srcdir/bin"
  export PATH=$PATH:$GOPATH/bin

  go get github.com/laurent22/massren
  cd src/github.com/laurent22/massren
  go build
}

package() {
  sed -n '/## License/,$p' "$srcdir/src/github.com/laurent22/massren/README.md" > "$srcdir/LICENSE"
  install -Dm644 "$srcdir/LICENSE" ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm755 "bin/massren" "$pkgdir/usr/bin/massren"
}
