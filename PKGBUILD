# Contributor: Matej Lach <matej.lach@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=birdfont
pkgver=1.9
pkgrel=2
pkgdesc='A free font editor that lets you create vector graphics and export TTF, EOT & SVG fonts'
arch=(i686 x86_64)
url='http://birdfont.org/'
license=('GPL3')
depends=('libgee' 'webkitgtk' 'libnotify')
makedepends=('vala' 'gettext' 'libgee' 'python2' 'gettext')
source=("http://birdfont.org/releases/${pkgname}-${pkgver}.tar.gz"
	'http://www.unicode.org/Public/UNIDATA/NamesList.txt')
md5sums=('4e6d5eac52874c65464674479b65d1e8'
         'a07e68e9cc6fb9c5001727d2813930ab')
install=birdfont.install

prepare() {
	cd "${srcdir}/$pkgname-$pkgver"
	sed -i -e 's/gtk+-2.0/gtk+-3.0/g' ./scripts/build.py	
}

build() {
	cd "${srcdir}/$pkgname-$pkgver"
	python2 ./configure -p /usr
	python2 ./scripts/linux_build.py -p /usr
}

package() {
	cd "${srcdir}/$pkgname-$pkgver"
	install -d -m 0755 "${pkgdir}/usr/share/unicode"
	python2 ./install.py -d "${pkgdir}" -n /share/man -l /lib
	install -m 0644 "${srcdir}/NamesList.txt" "${pkgdir}/usr/share/unicode"
}
