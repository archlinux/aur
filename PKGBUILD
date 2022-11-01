# Maintainer: Pawel Krawczyk <https://aur.archlinux.org/account/kravietz>

pkgname=pam-tacplus
pkgver=1.7.0
pkgrel=1
pkgdesc="PAM authentication against TACACS+ server"
arch=("x86_64" "aarch64")
url="https://github.com/kravietz/pam_tacplus/"
license=("GPL")
makedepends=("gnulib-git" "libtool" "autoconf" "automake")
depends=("pam")
source=("https://github.com/kravietz/pam_tacplus/archive/refs/tags/v1.7.0.tar.gz")
sha256sums=("b6c102eef0a42e3946bcdc29bbf7145c6dd13aa1fb6c58f6d282826166391837")

build() {
	cd "$srcdir/pam_tacplus-$pkgver"
	gnulib-tool --makefile-name=Makefile.gnulib --libtool --import \
                  fcntl crypto/md5 array-list list xlist getrandom realloc-posix \
                  explicit_bzero xalloc getopt-gnu
        autoreconf -f -v -i
        ./configure --prefix=/usr
        make
}

package() {
	cd "$srcdir/pam_tacplus-$pkgver"
	make DESTDIR="$pkgdir/" install
        rm "$pkgdir/usr/bin/runtests"
}
