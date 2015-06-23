# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=ccat-git
pkgver=r27.e7385e6
pkgrel=1
pkgdesc="Colorizes output for cat."
arch=('any')
url="https://github.com/jingweno/ccat"
license=('CUSTOM')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
conflicts=('ccat')
source=($pkgname::git+https://github.com/jingweno/ccat.git)
md5sums=('SKIP')
pkgver() {
  cd $srcdir/$pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    msg2 'Building ccat'
    ./build
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 $srcdir/$pkgname/ccat "$pkgdir/usr/bin"
  
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -m 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/

}
