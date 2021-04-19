# Maintainer: Célestin Matte aur [at] ploudseeker dot com
# Contributor: tealeaf joss-arch@pseudonymity.net
# Contributor: ormris ormris@ormris.com

pkgname="wyrd-git"
pkgver=20210419.5872ee0
pkgrel=1
pkgdesc="A text-based front-end to Remind."
arch=('i686' 'x86_64')
url="https://github.com/Perdu/wyrd"
license=('GPL2')
provides=('wyrd')
conflicts=('wyrd')
depends=('remind' 'ncurses' 'less')
makedepends=('git' 'ocaml' 'camlp4' 'python'  'autoconf')
# doc: 'hevea' 'texlive-core' 'texlive-latexextra'
source=("git+https://github.com/Perdu/wyrd.git")
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/${pkgname%-git}"
	git log -1 --format='%cd.%h' --date=short | tr -d - | sed 's/-/./'
}

build() {
        cd "$srcdir/${pkgname%-git}"
        autoconf
        # compile documentation (removed)
        # cd "$srcdir/${pkgname%-git}/doc/"
	# make all
        cd "$srcdir/${pkgname%-git}"
	./configure --exec-prefix=/usr --prefix=/usr --sysconfdir=/etc --enable-utf8
	make
}

package() {
        cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
