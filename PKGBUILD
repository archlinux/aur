# Maintainer: Franc[e]sco <lolisamurai@tfwno.gf>

pkgname=sharenix-git
pkgver=r146.3ce23df
pkgrel=1
pkgdesc="file uploading tool with ShareX-compatible config"
arch=('i686' 'x86_64')
url="https://github.com/francesco149/sharenix"
license=('GPLv3')
provides=('sharenix')
makedepends=('git' 'go' 'gtk2' 'pkgconf')
depends=('glibc' 'gtk2')
optdepends=('gnome-screenshot: allows screenshotting regions with sharenix-window and sharenix-section')
source=("git+https://github.com/Francesco149/sharenix.git")
md5sums=('SKIP')
install=sharenix-git.install

pkgver() {
  cd "$srcdir/sharenix"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"

  mkdir -p build/src/github.com/Francesco149
  ln -sf "$srcdir/sharenix" build/src/github.com/Francesco149/
}

build() {
  export GOPATH="$srcdir/build"
  cd "$GOPATH/src/github.com/Francesco149/sharenix"
  go get ./...
}

package() {
  install -Dm755 "$srcdir/build/bin/sharenix" -t "$pkgdir/usr/bin/"
  install -Dm755 "$srcdir/sharenix/sharenix-section" -t "$pkgdir/usr/bin/"
  install -Dm755 "$srcdir/sharenix/sharenix-window" -t "$pkgdir/usr/bin/"
  install -Dm644 "$srcdir/sharenix/sharenix.json" -t "$pkgdir/etc/"
  install -Dm644 "$srcdir/sharenix/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
