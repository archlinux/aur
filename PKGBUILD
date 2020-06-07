# Maintainer: Alberto Fanjul <albertofanjul@gmail.com>
pkgname=git-ignore-tool-git
_name=git-ignore-tool
pkgver=35.1674505
pkgrel=1
pkgdesc="Easy configuration of git ignored files"
arch=('i686' 'x86_64')
url="https://github.com/albfan/git-ignore"
license=('GPL')
makedepends=(git pkgconf)
provides=("git-ignore-tool-git")
conflicts=("git-ignore-tool")
source=("$_name::git+https://github.com/albfan/git-ignore.git#branch=master"
        "sharness::git+https://github.com/mlafeldt/sharness.git")
md5sums=('SKIP'
         'SKIP')

prepare() {
  cd "$srcdir/$_name"
  git submodule init
  git config submodule.t/sharness.url $srcdir/sharness
  git submodule update
}

pkgver() {
  cd "$srcdir/$_name"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_name"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$_name"
  make check
}

package() {
  cd "$srcdir/$_name"
  make DESTDIR="$pkgdir/" install
}

