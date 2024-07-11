pkgname="spark-git"
pkgver="0.1.0"
pkgrel="2"
pkgdesc="Spark is a static-site generator that's intuitive and designed for simplicity."
arch=("x86_64")
depends=("go")
makedepends=("git")
license=("GPL3")
url="https://gitlab.com/EndowTheGreat/spark"
source=("${pkgname}::git+${url}")
sha256sums=("SKIP")

build() {
  cd "$srcdir/$pkgname"
  export GOPATH="$srcdir/go"
  mkdir -p "$GOPATH/src/gitlab.com/EndowTheGreat"
  ln -sf "$srcdir/$pkgname" "$GOPATH/src/gitlab.com/EndowTheGreat/$pkgname"
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -Dm755 bin/$pkgname "$pkgdir"/usr/bin/spark
}
