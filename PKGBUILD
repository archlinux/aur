# Maintainer: a821
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=girara-git
pkgver=0.4.4.r1.g23b4ed7
pkgrel=1
pkgdesc="User interface library focused on simplicity and minimalism"
arch=('x86_64')
url="https://pwmt.org/projects/girara"
license=('Zlib')
depends=('gtk3' 'glib2' 'json-c' 'pango' 'glibc')
makedepends=('git' 'meson' 'ninja' 'doxygen' 'check')
conflicts=('girara')
provides=('girara')
source=("${pkgname}::git+https://github.com/pwmt/girara.git#branch=develop")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags --long | sed 's/-/.r/;s/-/./g'
}

build() {
  cd "$pkgname"
  arch-meson build -Dtests=disabled
  ninja -C build
}

package() {
  cd "$pkgname"
  DESTDIR="$pkgdir/" ninja -C build install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
