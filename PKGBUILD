# Maintainer: Vic Luo <vicluo96@gmail.com>
# Co-Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=cppreference-devhelp
pkgver=20161029
pkgrel=1
pkgdesc="Offline cppreference documentation for devhelp."
arch=('any')
url="http://en.cppreference.com/w/"
license=('CCPL:cc-by-sa')
depends=('devhelp' 'cppreference')
makedepends=('python-lxml')
source=("http://upload.cppreference.com/mwiki/images/d/d9/cppreference-doc-$pkgver.tar.gz")
md5sums=('a4b5d7efc8a694ca0005c882304c141e')

prepare() {
    cd "$srcdir/cppreference-doc-$pkgver"
    sed -i 's#$(docdir)/html#$(docdir)#' Makefile
}

build() {
    cd "$srcdir/cppreference-doc-$pkgver"
    make docdir='/usr/share/doc/cppreference' doc_devhelp
}

package() {
    cd "$srcdir/cppreference-doc-$pkgver"
    install -DT -m 644 "output/cppreference-doc-en-c.devhelp2" \
		"${pkgdir}/usr/share/devhelp/books/cppreference-doc-en-c/cppreference-doc-en-c.devhelp2"
	install -DT -m 644 "output/cppreference-doc-en-cpp.devhelp2" \
		"${pkgdir}/usr/share/devhelp/books/cppreference-doc-en-cpp/cppreference-doc-en-cpp.devhelp2"
}
