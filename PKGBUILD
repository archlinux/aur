# Maintainer: Ian Beringer <ian@ianberinger.com>
# Contributor: Matthias Lisin <ml@visu.li>

pkgname=kube-prompt
pkgver=1.0.9
_gitrev=e384176
pkgrel=1
license=('MIT')
pkgdesc='An interactive kubernetes client featuring auto-complete using go-prompt'
arch=("i686" "x86_64" "aarch64" "arm7h")
url='https://github.com/c-bata/kube-prompt'
depends=('kubectl')
makedepends=('git' 'go')
provides=("$pkgname")
conflicts=("${pkgname}-git")
source=("$pkgname::$url/archive/v$pkgver.tar.gz")
sha512sums=('2f8bd1a655135ce00e3834eb6d5f92dc7e8272794356e18d08c7d6dfa790819651960b120cb33936d728681fd019ef1191e261b05c95cb3fa640ea3b42033c51')

build() {
  cd "$pkgname-$pkgver"
  go build -o "$pkgname" -trimpath -ldflags "\
      -X 'main.version=v$pkgver' \
      -X 'main.revision=$_gitrev' \
      -extldflags ${LDFLAGS}"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
