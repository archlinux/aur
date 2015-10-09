# Maintainer: Masanori Ohgita <mp at ohgita dot info>
pkgname=libpafe-ruby
pkgver=0.0.8
pkgrel=1
pkgdesc='A library using the libpafe on ruby'
arch=('any')
url='http://homepage3.nifty.com/slokar/pasori/libpafe-ruby.html'
license=('GPL2')
depends=('libpafe' 'ruby')
source=("http://homepage3.nifty.com/slokar/pasori/${pkgname}-${pkgver}.tar.gz")
sha256sums=('496b5f6299c14b6b11e4bd8fb1f2bd093ed75a6fee23635a1eb257b762e216cc')

build() {
	cd "${srcdir}/${pkgname}/"
	if [ -f '.RUBYARCHDIR.time' ]; then
		rm '.RUBYARCHDIR.time'
	fi
	ruby extconf.rb
	make $MAKEFLAGS
}

check() {
	cd "${srcdir}/${pkgname}/"
	ruby -e 'require "./pasori.so"; puts "OKAY";'
}

package() {
	cd "${srcdir}/${pkgname}/"
	make DESTDIR="${pkgdir}" install
}
