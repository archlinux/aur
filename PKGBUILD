# Maintainer: Jiuyang Liu <liujiuyang1994@gmail.com>

_pkgname=wake
pkgname=$_pkgname-git
pkgver=r1216.f64b193
pkgrel=1
pkgdesc="The SiFive wake build tool"
arch=('x86_64')
url="https://github.com/sifive/wake"
license=('custom')
depends=('dash' 'sqlite' 'gmp' 'fuse-common' 're2' 'ncurses5-compat-libs')
optdepends=('re2c'
            'utf8proc')
source=("git://github.com/sifive/wake.git")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$_pkgname
  git checkout master
}

build() {
  cd $srcdir/$_pkgname
  make
}

package() {
  cd $srcdir/$_pkgname
  ./bin/wake 'install "'$pkgdir'/usr"'
  mkdir -p $pkgdir/usr/share/licenses/wake
  install -Dm644 $srcdir/$_pkgname/LICENSE* $pkgdir/usr/share/licenses/wake
}
