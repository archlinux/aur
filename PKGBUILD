# Maintainer: Roman Mishin <xtradev (a) yandex (.) ru>
pkgname=tktreectrl-git
pkgver=2.4.2
pkgrel=1
pkgdesc='Multi-column hierarchical listbox widget for the Tk GUI toolkit.'
arch=('x86_64')
url='https://github.com/apnadkarni/tktreectrl'
license=('custom')
depends=('tk' 'libx11')
makedepends=('gcc' 'git')
provides=('tktreectrl')
conflicts=('tktreectrl')
install='.INSTALL'
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  sed -nr 's/PACKAGE_PATCHLEVEL=(.+)/\1/p' "$srcdir/tktreectrl/configure"
}

prepare() {
  cd "$srcdir/tktreectrl"
  git apply ../../arch-paths.patch
  sh ./configure --prefix=/usr --enable-threads --enable-64bit
}

build() {
  cd "$srcdir/tktreectrl"
  make
}

package() {
  cd "$srcdir/tktreectrl"
  make DESTDIR="$pkgdir" install
  install -Dm444 license.terms "$pkgdir/usr/share/licenses/tktreectrl/LICENSE"
}
