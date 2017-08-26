# Maintainer: Arnoud Willemsen <mail at lynthium dot com>

pkgname=firejail-git
pkgver=r2937.83afac08
pkgrel=1
pkgdesc="Linux namespaces sandbox program (GIT version)"
arch=(i686 x86_64)
license=(GPL2)
url="https://github.com/netblue30/firejail"
source=("${pkgname}::git+https://github.com/netblue30/firejail.git")
sha512sums=('SKIP')
conflicts=('firejail')
provides=('firejail')
backup=('etc/firejail/login.users'
        'etc/firejail/firejail.config')

pkgver() {
  	cd "${srcdir}/${pkgname}"
  	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" | sed 's/^v//;s/-/./g'
}

build() {
  	cd "${srcdir}/${pkgname}"
	# fix build
	export CFLAGS=${CFLAGS/-fsanitize=undefined/}
	./configure --prefix=/usr
	make
}

package() {
  	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
}

# vim: set ts=2 sw=2 et:
