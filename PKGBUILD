# Maintainer: Arthur Vuillard <arthur@hashbang.fr>
# Previous maintainer: Martin Imobersteg <martin.imobersteg@gmail.com>
pkgname=tidy-html5-git
name=tidy-html5
pkgver=5.0.0.git_493.f450263
pkgrel=1
pkgdesc="A tool to tidy down your HTML5 code to a clean style"
url="https://github.com/htacg/tidy-html5"
license=('custom')
arch=('i686' 'x86_64')
depends=()
makedepends=('git' 'cmake')
provides=('tidy')
conflicts=('tidy-html5' 'tidyhtml')
source=('git://github.com/htacg/tidy-html5.git')
md5sums=('SKIP')

pkgver(){
    cd $srcdir/$name

    echo 5.0.0.git_$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$name/build/cmake"
  cmake ../.. -DCMAKE_INSTALL_PREFIX=$pkgdir/usr
  make
}

package() {
  cd "$srcdir/$name/build/cmake"
  make install
  install -Dm644 $srcdir/$name/LICENSE.md $pkgdir/usr/share/licenses/$name/LICENSE.md
  rm -rf $pkgdir/usr/include
} 
