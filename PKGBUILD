# Maintainer: Naleo <naleo@naleo.me>
_pkgname=gswitch
pkgname=$_pkgname-git
pkgver=r40.8534934
pkgrel=1
pkgdesc="Script and service to easily switch between eGPU and internal graphics"
arch=('any')
url="https://github.com/karli-sjoberg/gswitch"
license=('BSD 3-Clause License Revised')
depends=('bash>=4.0')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=("${pkgname}::git+https://github.com/karli-sjoberg/gswitch")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    sed -i "s/systemctl/#systemctl/g" "$srcdir/${pkgname}/Makefile"
}
package() {
	cd "$srcdir/${pkgname}"
	make DESTDIR="$pkgdir/" install
    install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" $srcdir/${pkgname}/LICENSE
}

