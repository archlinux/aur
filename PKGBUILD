# Contributor: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: fanningert <thomas@fanninger.at>

pkgname=glide
pkgver=0.13.3
pkgrel=3
pkgdesc='Dependency management and vendoring for Go projects'
arch=('x86_64')
url='https://github.com/Masterminds/glide'
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
_commit=8ed5b9292379d86c39592a7e6a58eb9c903877cf  # tags/v0.13.3^0
source=("git+$url#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
  export GOPATH="$srcdir/go"
  _gosrc="$GOPATH/src/${url#https://}"
  rm -rf "$GOPATH"
  mkdir -p "${_gosrc%/*}"
  mv -T glide "$_gosrc"
}

build() {
  export GOPATH="$srcdir/go"
  cd "$GOPATH/src/${url#https://}"

  go build -o glide -ldflags "-X main.version=$pkgver" glide.go
}

package() {
  export GOPATH="$srcdir/go"
  cd "$GOPATH/src/${url#https://}"

  install -Dm755 glide "$pkgdir/usr/bin/glide"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# getver: github.com/Masterminds/glide
# vim: ts=2 sw=2 et:
