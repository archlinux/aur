# Maintainer: Ian Beringer <ian@ianberinger.com>
# Contributor: Matthias Lisin <ml@visu.li>

pkgname=kube-prompt
pkgver=1.0.8
_gitrev=eed9b10
pkgrel=2
license=('MIT')
pkgdesc='An interactive kubernetes client featuring auto-complete using go-prompt'
arch=("i686" "x86_64" "aarch64" "arm7h")
url='https://github.com/c-bata/kube-prompt'
depends=('kubectl')
makedepends=('git' 'go')
provides=("$pkgname")
conflicts=("${pkgname}-git")
source=("$pkgname::$url/archive/v$pkgver.tar.gz")
sha512sums=('2266e98a76f12d7ae635c37bbce45b19df4a22c0ca7533e64ec453e35bb797bfd5b10bf06e4e9d94c622742d7c5a8e4e99ded0a2248b1481de2ab684cccd7f34')

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
