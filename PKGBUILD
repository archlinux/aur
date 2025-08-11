# Maintainer: dvb < echo =oQZk5ibltmcwIGQ4VnbpxGajJXY | rev | base64 -d >

pkgname=j3kareple
_pkgname=reple
pkgver=0.1.0
pkgrel=1
pkgdesc="Reple - wrapper for your repl"
arch=('x86_64')
url="https://github.com/j3ka/reple"
license=('GPL3')
depends=('glibc')
makedepends=('go')
provides=('reple')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('9fe8e61bab8342b3bc0c6300f9fe005fbd23194ee46a97a90f6caf4f85d872be3b57816c6d56f0a86b54946cfaa9be30be040e582a169ccf07039fcd929aa746')

build() {
  cd "$_pkgname-$pkgver"
  GOPATH="$srcdir/build" go build -buildmode=pie -ldflags "-linkmode=external -extldflags \"$LDFLAGS\"" -modcacherw -trimpath
}

package() {
  install -Dm755 "$_pkgname-$pkgver/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
