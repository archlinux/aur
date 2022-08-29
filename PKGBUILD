# Maintainer: Guoyi Zhang <myname at malacology dot net>

pkgname=ev-view
pkgver=20160216.161212
pkgrel=2
pkgdesc="A tool for visualization of evs results."
arch=(x86_64)
url="https://github.com/js-arias/ev-view"
license=('BSD')
depends=('gcc-libs' 'gtk2')
makedepends=('make' 'gcc' 'git')
source=("git+$url.git"
		"Makefile")
md5sums=('SKIP'
         '618c34f7fe24aaf28c5904772668c29d')

pkgver(){
  cd $srcdir/$pkgname
  printf "$(TZ=UTC git log -1 --pretty='%cd' --date=format-local:%Y%m%d.%H%M%S)"
}

prepare(){
  cd $srcdir
  cp Makefile $pkgname/ 
}


build() {
  cd $srcdir/$pkgname
  make release
}

package() {
  cd $srcdir/$pkgname
  cd bin/Release
  chmod +x ev
  install -Dm 755 ev ${pkgdir}/usr/bin/$pkgname
}
