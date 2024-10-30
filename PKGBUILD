# Contributor: Atte Lautanala <atte@lautana.la>
pkgname=pyonji
pkgver=0.1.0
pkgrel=1
pkgdesc="An easy-to-use tool to send e-mail patches"
arch=('x86_64')
url="https://sr.ht/~emersion/pyonji"
license=('GPL3')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~emersion/pyonji/archive/v$pkgver.tar.gz")
b2sums=('2a87bac1646937956b01a52f239b43e58918cf3044b777788b4793d60ff2fd51440a0e646005bbffd832da257510c771c2111fc127fdc8df2ddf6b465dbfb918')

build() {
  cd "${pkgname}-v${pkgver}"

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  go build -buildmode=pie -trimpath -mod=readonly -modcacherw -o "$pkgname"
}

package() {
  install -Dm755 "$srcdir/$pkgname-v$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
