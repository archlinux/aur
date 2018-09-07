# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=wmuc
pkgver=0.2.0
pkgrel=1
pkgdesc="A git repository manager."
arch=(x86_64)
url="https://github.com/mfinelli/wmuc"
license=(GPL3)
makedepends=(go)
source=(https://github.com/mfinelli/wmuc/releases/download/v$pkgver/wmuc-v$pkgver.tar.gz{,.asc}
        https://github.com/mfinelli/wmuc/releases/download/v$pkgver/third-party.tar.gz{,.asc})
sha256sums=('b0bf71936716b0e967d83b794fcc63599f027342bc32340f043caab7d72a266c'
            'SKIP'
            '91a46a30b00e38c27ce4497789f126f2dd4058481378fa3a8be61ac63cab5181'
            'SKIP')
validpgpkeys=(C3CD75B002978A8468CA7B1F6C3ADDDE36FDA306)
noextract=("$pkgname-v$pkgver.tar.gz")

prepare() {
  export GOPATH="$srcdir"
  mkdir -p src/github.com/mfinelli/$pkgname

  bsdtar -xf "$pkgname-v$pkgver.tar.gz" \
    -C src/github.com/mfinelli/$pkgname
  mv vendor src/github.com/mfinelli/$pkgname/
}

check() {
  export GOPATH="$srcdir"
  cd src/github.com/mfinelli/$pkgname
  make test
}

build() {
  export GOPATH="$srcdir"
  cd src/github.com/mfinelli/$pkgname
  make
}

package() {
  cd src/github.com/mfinelli/$pkgname
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
