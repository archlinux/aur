# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=needrestart-git
pkgver=3.5.r0.gdfc7c12
pkgrel=1
pkgdesc='Restart daemons after library updates.'
arch=('any')
url="https://github.com/liske/needrestart"
license=('GPL')
depends=('perl-module-find' 'perl-term-readkey' 'perl-proc-processtable'
         'perl-sort-naturally' 'perl-module-scandeps' 'perl-libintl-perl')
optdepends=('iucode-tool: for outdated Intel microcode detection')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=(!emptydirs)
source=('git+https://github.com/liske/needrestart.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	sed -i -e 's|/usr/sbin|/usr/bin|' Makefile
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	make INSTALLDIRS=vendor DESTDIR="$pkgdir/" install
}
