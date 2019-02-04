pkgname=kafs
_pkgname=kafs
pkgver=r16.0ae929f
pkgrel=1
license=("GPL2")
pkgdesc="kafs client tools"
makedepends=("gcc" "git" "krb5" "openssl")
arch=("i686" "x86_64")
url="https://www.infradead.org/~dhowells/kafs/"
source=("${pkgname%-*}::git://git.infradead.org/users/dhowells/kafs-client.git")
sha1sums=("SKIP")
provides=("kafs")
conflicts=("kafs")

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
        cd "${srcdir}/${_pkgname}"
        make DESTDIR="$pkgdir" LIBDIR=/usr/lib  all 
}

package() {
        cd "${srcdir}/${_pkgname}"
	make DESTDIR="$pkgdir" LIBDIR=/usr/lib install all
}
