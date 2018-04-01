# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>
# Contributor: Kohei Suzuki <eagletmt@gmail.com>

pkgname=ghq
pkgver=0.8.0
pkgrel=4
pkgdesc="Remote repository management made easy"
arch=('i686' 'x86_64')
url="https://github.com/motemen/ghq"
license=('MIT')
makedepends=('go' 'git')
optdepends=('zsh: ghq function for zsh')
source=("ghq-${pkgver}.tar.gz::https://github.com/motemen/ghq/archive/v${pkgver}.tar.gz"
        "url.go.patch"
        "url_test.go.patch")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export GOPATH="$srcdir/build"
  go get -t -d -v
  patch < ../url.go.patch
  patch < ../url_test.go.patch
  go build .
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export GOPATH="$srcdir/build"
  go test -x -v .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm 755 ghq-$pkgver "$pkgdir/usr/bin/ghq"
  install -Dm 644 zsh/_ghq "$pkgdir/usr/share/zsh/site-functions/_ghq"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/ghq/LICENSE"
}

# vim: set et sw=2 sts=2:

sha512sums=('8b9e9f1d2445391700b91559c4c95968e26f083d5af50102d2bc05baa1f5b92a5d19b8bb3fbb2c48071ed20851a55b4bc8fc1ef60bcb299f04404a56fff15902'
            '875c340b4cc093bba537187ddf5eff9f59aa92ed32791bf72c3150126a59a8f29ea0ca4031718d5df57426a7d2ecf221e450def27c6eb65c81b7be6feb7b26e2'
            '7ecb8ee1503e815f29626837420d1b52f72bc22bcd1254e5d3166d6b22aaf25e8a5bc1bcdde3d1ec7e71b33f03cbd28d4d68a9527f30d5d66081be08c9d65d5b')
