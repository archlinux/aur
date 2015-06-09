# Maintainer: bitwave <bitwave [At] oomlu [d.o.T] de>

pkgname=dms
pkgver=r177.1a89a12c7cae
pkgrel=2
pkgdesc='UPnP DLNA Digital Media Server'
arch=('x86_64' 'i686')
url='https://bitbucket.org/anacrolix/dms/'
license=('BSD')
makedepends=('go' 'git' 'mercurial')
depends=('glibc')

_download() {
  mkdir --p "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"

  GOPATH="$srcdir" go get -d bitbucket.org/anacrolix/dms
}

pkgver() {
  _download
  cd "$srcdir/src/bitbucket.org/anacrolix/dms"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  mkdir --p "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"

  GOPATH="$srcdir" go get bitbucket.org/anacrolix/dms
}

package() {
  cd "$srcdir"

  install -Dm755 "bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "src/bitbucket.org/anacrolix/dms/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et: