# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>
# Contributor: Kohei Suzuki <eagletmt@gmail.com>

pkgname=ghq
pkgver=0.8.0
pkgrel=1
pkgdesc="Manage remote repository clones"
arch=('i686' 'x86_64')
url="https://github.com/motemen/ghq"
license=('MIT')
makedepends=('go' 'git')
optdepends=('zsh: ghq function for zsh')
source=("ghq-${pkgver}.tar.gz::https://github.com/motemen/ghq/archive/v${pkgver}.tar.gz")

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/build"
  go get -t -d -v
  go build
}

check() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/build"
  go test
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 ghq-$pkgver "$pkgdir/usr/bin/ghq"
  install -Dm 644 zsh/_ghq "$pkgdir/usr/share/zsh/site-functions/_ghq"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/ghq/LICENSE"
}

# vim: set et sw=2 sts=2:

sha512sums=('8b9e9f1d2445391700b91559c4c95968e26f083d5af50102d2bc05baa1f5b92a5d19b8bb3fbb2c48071ed20851a55b4bc8fc1ef60bcb299f04404a56fff15902')
