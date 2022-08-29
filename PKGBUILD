# Maintainer: Guoyi Zhang <myname at malacology dot net>

pkgname=evs
pkgver=20161229.215801
pkgrel=3
pkgdesc="A tool for phylogenetic biogeography"
arch=(x86_64)
url="https://github.com/js-arias/evs"
license=('BSD')
makedepends=('go' 'git')
source=("git+$url.git")
md5sums=('SKIP')

pkgver(){
  cd $srcdir/$pkgname
  printf "$(TZ=UTC git log -1 --pretty='%cd' --date=format-local:%Y%m%d.%H%M%S)"
}

prepare(){
  cd $srcdir/$pkgname
  echo "module evs" > go.mod
}


build() {
  cd $srcdir/$pkgname
for bin in biogeo cmdapp events raster tree
do
	go get github.com/js-arias/evs/$bin
done
  go build
}

package() {
  cd $srcdir/$pkgname
  chmod +x $pkgname
  install -Dm 755 $pkgname ${pkgdir}/usr/bin/$pkgname
}
