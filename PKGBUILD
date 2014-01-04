gitname=s3fs-c
pkgname=${gitname}-git
pkgver=57.9c6d31b
pkgrel=1
pkgdesc="Fork of s3fs"
arch=('i686' 'x86_64')
url="https://github.com/tongwang/s3fs-c"
license=('GPL2')
depends=('fuse' 'glib2' 'libxml++' 'mime-types')
makedepends=('git')
conflicts=('s3fs')
provides=('s3fs')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
	 cd "${srcdir}/${gitname}"
	 local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	 printf "%s" "${ver//-/.}"
}

build() {
	 cd "${srcdir}/${gitname}"
	 ./configure --prefix=/usr || return 1
	 make || return 1
}

package() {
	 cd "${srcdir}/${gitname}"
	 make DESTDIR="${pkgdir}/" install
}
