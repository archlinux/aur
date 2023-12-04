# Maintainer: MF Akane <aur at sorairo dot pictures>
pkgname=mackerel-check-plugins-git
pkgver=0.46.1
pkgrel=1
pkgdesc="Check Plugins for monitoring written in golang"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/mackerelio/go-check-plugins"
license=('Apache')
depends=()
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname"::'git+https://github.com/mackerelio/go-check-plugins.git')
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --abbrev=0 | sed 's/^v//' | sed 's/\+.*$$//'
}

build() {
  cd "$srcdir/$pkgname"
  make build/mackerel-check
}

package() {
  install -Dm755 "$srcdir/$pkgname/build/mackerel-check" "$pkgdir/usr/bin/mackerel-check"

  for i in `cat "$srcdir/$pkgname/packaging/deb/debian/source/include-binaries"`; do
    filename=$(basename $i)
    ln -s ./mackerel-check "$pkgdir/usr/bin/$filename"
  done
}
