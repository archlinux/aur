# Maintainer: Kibouo <csonka.mihaly@hotmail.com>
pkgname=r-rustinr
pkgver=r214.9996184
pkgrel=2
pkgdesc='Rust and R Integration.'
arch=('any')
url='https://github.com/rustr/rustinr'
license=('Apache License 2.0')
depends=('r' 'rustup')
optdepends=('r-testthat')
makedepends=('git' 'r-devtools')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}::git+https://github.com/rustr/rustinr.git")
md5sums=('SKIP')
pkgver() {
	cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build(){
    R CMD build r-rustinr
    R CMD INSTALL r-rustinr_*.tar.gz -l $srcdir
}    
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir"/rustinr "$pkgdir/usr/lib/R/library"    
}
