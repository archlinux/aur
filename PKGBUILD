# Maintainer: fossdd <fossdd@pwned.life>
# Contributor: Atte Lautanala <atte@lautana.la>
pkgname=pyonji
pkgver=0.1.0
pkgrel=2
pkgdesc="An easy-to-use tool to send e-mail patches"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://sr.ht/~emersion/pyonji"
license=('GPL-3.0-only')
depends=('git')
makedepends=('go')
source=("https://git.sr.ht/~emersion/pyonji/refs/download/v$pkgver/pyonji-$pkgver.tar.gz")
b2sums=('2a4d946f4167e5f698734179acbd1191592702ded29ef6d94686c802333fb8ce14365acf8d8b51c9f38a9fcf160e76b9d05be30b979f32549dbf1a18f1e5aa5e')

build() {
  cd $pkgname-$pkgver

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  go build -buildmode=pie -trimpath -mod=readonly -modcacherw -o "$pkgname"
}

package() {
  install -Dm755 "$srcdir"/$pkgname-$pkgver/pyonji \
	  -t "$pkgdir"/usr/bin/
}
