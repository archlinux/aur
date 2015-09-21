# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=libspf2-git
pkgver=1.2.10.r189.79ed3e3
pkgrel=1
pkgdesc="Implementation of the Sender Policy Framework for SMTP authorization"
arch=('i686' 'x86_64')
url="http://www.libspf2.org/"
license=('LGPL' 'BSD')
makedepends=('git')
provides=('libspf2')
source=('git+https://github.com/shevek/libspf2.git')
md5sums=('SKIP')

pkgver() {
  cd libspf2
  printf "%s.r%s.%s" "$(./configure -V | head -1 | cut -d\  -f3)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd libspf2
	./configure --prefix=/usr --program-transform-name="s/^spf[dq].*/&.libspf2/"
	make
}


package() {
	cd libspf2
	make DESTDIR="$pkgdir/" install

    rm -v "$pkgdir"/usr/bin/*static*
}
