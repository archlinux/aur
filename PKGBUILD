# Maintainer: tuberry
# Contributor: simsilver

pkgname=dict-ecdict-git
_ver=1.0.0
_pkg=${pkgname%-git}
_zip=ecdict-ultimate-csv.zip
pkgver=1.0.0.r17.337f198
pkgrel=1
pkgdesc="A port of Ultimate ECDICT database for dictd et al."
arch=(any)
url=https://github.com/skywind3000/ECDICT-ultimate
license=(MIT)
depends=(dictd)
makedepends=(dictd git curl python unzip)
provides=("$_pkg")
conflicts=("$_pkg")
install="$pkgname".install
source=("$_zip::$url/releases/download/$_ver/$_zip"
        "git+https://github.com/tuberry/$_pkg")
sha512sums=('c9353d793c28ee22a40924ed1deb98327ca12c270be0b2bc94de1d66cd582d2bf8f13eb835a787f7ecf144b9a69813024edd5385d2d6e9b4adfeaa79926c95cc'
            'SKIP')

pkgver() {
  cd "$_pkg"
  printf "%s.r%s.%s" "$_ver" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  cd "$_pkg"
  ln -sf "$srcdir/$_zip" "$_zip"
}

build() {
  cd "$_pkg"
  make
}

package() {
  cd "$_pkg"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
