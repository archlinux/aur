# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=udf-infusion-git
_pkgname=${pkgname%-git}
_reponame=udf_infusion
pkgver=r104.25c3613
pkgrel=1
pkgdesc="MySQL functionality enhancement UDF"
arch=('i686' 'x86_64')
url="https://github.com/infusion/udf_infusion"
license=('GPL2')
depends=('gcc-libs')
makedepends=('mysql')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/infusion/udf_infusion")
sha256sums=(SKIP)

pkgver() {
	cd "$_reponame"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_reponame"
	./configure --prefix=/usr
	make
}

package() {
	cd "$_reponame"
	make DESTDIR="$pkgdir/" install
}
