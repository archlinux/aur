# Maintainer: bitwave <bitwave [At] oomlu [d.o.T] de>

pkgname=dms
pkgver=198.fcc412c
pkgrel=1
pkgdesc='UPnP DLNA Digital Media Server'
arch=('x86_64' 'i686')
url='https://github.com/anacrolix/dms/'
license=('BSD')
makedepends=('go' 'git' 'mercurial')
depends=('glibc')

_download() {
  mkdir --p "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"

  GOPATH="$srcdir" go get -d github.com/anacrolix/dms
}

pkgver() {
  _download
  cd "$srcdir/src/github.com/anacrolix/dms"
  local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  printf "%s" "${ver//-/.}"
}

build() {
  mkdir --p "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"

  GOPATH="$srcdir" go get github.com/anacrolix/dms
}

package() {
  cd "$srcdir"

  install -Dm755 "bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "src/github.com/anacrolix/dms/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et: