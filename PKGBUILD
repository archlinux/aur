# Maintainer: Ian Beringer <ian@ianberinger.com>
# Contributor: Matthias Lisin <ml@visu.li>

pkgname=kube-prompt
pkgver=1.0.10
_gitrev=43bcffa
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
sha512sums=('ae904714536e17bbd1fc971b544811a925e286ededd4b5a5491dc6d836773ed9b23ca85bbb9c54e1d606018dabcf5e6f7079af9a2a9bf8c87bc7c34872ef0b24')

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
