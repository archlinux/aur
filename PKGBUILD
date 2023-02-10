pkgname=bayarea
pkgver=1.0.3
pkgrel=1
pkgdesc="Bayesian inference of historical biogeography for many discrete areas https://doi.org/10.1093/sysbio/syt040"
arch=('x86_64')
url="https://github.com/mlandis/bayarea"
license=('MIT')
makedepends=('gcc' 'git')
source=("git+$url.git")
md5sums=('SKIP')
pkgver(){
  cd "$pkgname"/code
  printf $(grep 'BayArea ' main.cpp | sed 's@v@@g' | sed 's/\\n\"/ /g' | awk '{print $4}')
}
build(){
  cd $pkgname/code
  g++ -O3 *.cpp -o $pkgname
}

package() {
  cd $pkgname/code
  chmod +x $pkgname
  install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
}
