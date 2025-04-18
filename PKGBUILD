# Contributor: Sara <sara at archlinux dot us>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=wakeup-git
pkgver=r54.49db7f6
pkgrel=1
epoch=1
pkgdesc='A timer that will wake your system from suspend to RAM.'
arch=('i686' 'x86_64')
url="https://github.com/fogobogo/wakeup"
license=('GPL-2.0')
depends=('glibc' 'pm-utils')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver(){
	cd "${srcdir}/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build(){
	cd "${srcdir}/${pkgname}"
	make
}

package(){
	cd "${srcdir}/${pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
