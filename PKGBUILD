# Maintainer: Bogdan Sinitsyn <f1u77y@yandex.ru>
pkgname=web-media-controller-mpris
_gitpkgname=wmc-mpris
pkgver=0.1.0
pkgrel=2
pkgdesc="MPRIS proxy for usage with Web Media Controller on GNU/Linux "
arch=('i686' 'x86_64')
url="https://github.com/f1u77y/wmc-mpris"
license=('custom:Unlicense')
depends=(
  glib2
  json-glib
)
makedepends=(
  git
  cmake
  python
)
optdepends=(
  'firefox: could be controlled with this tool'
  'chromium: could be controlled with this tool'
  'google-chrome: could be controlled with this tool'
  'opera: could be controlled with this tool'
)
conflicts=(
  "$pkgname-git"
)
source=("https://github.com/f1u77y/$_gitpkgname/archive/v0.1.0.tar.gz")
sha512sums=('20b70ed606b534916241d51de2954013d80f3263e2a3b338d01fb18877149bd6f70bc3713d94b66c714e519025f584cbf96b49323d023b94a927a865885cc985')

prepare() {
  cd "$srcdir/$_gitpkgname-$pkgver"

  mkdir -p build
}

build() {
  cd "$srcdir/$_gitpkgname-$pkgver"

  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir/$_gitpkgname-$pkgver"

  cd build
  make DESTDIR="$pkgdir/" install

  cd ..
  install -m 755 -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
