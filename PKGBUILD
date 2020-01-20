# Maintainer: MF Akane <aur at sorairo dot pictures>
pkgname=mackerel-agent-plugins-git
pkgver=0.59.0
pkgrel=2
pkgdesc="Plugins for mackerel-agent"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/mackerelio/mackerel-agent-plugins"
license=('Apache')
depends=()
makedepends=('git' 'go' 'perl')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname"::'git+https://github.com/mackerelio/mackerel-agent-plugins.git')
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --abbrev=0 | sed 's/^v//' | sed 's/\+.*$$//'
}

build() {
  cd "$srcdir/$pkgname"
  make build
}

package() {
  for i in `cat "$srcdir/$pkgname/packaging/deb/debian/source/include-binaries"`; do
    filename=$(basename $i)
    install -Dm755 "`ls $srcdir/$pkgname/build/linux/*/$filename | head -n 1`" "$pkgdir/usr/bin/$filename"
  done
}
