# Maintainer: Vic Luo <vicluo96@gmail.com>
# Co-Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=cppreference-devhelp
pkgver=20151129
pkgrel=1
pkgdesc="Offline cppreference documentation for devhelp."
arch=('any')
url="http://en.cppreference.com/w/"
license=('CCPL:cc-by-sa')
depends=('devhelp' 'cppreference')
makedepends=('python')
source=("http://upload.cppreference.com/mwiki/images/6/60/cppreference-doc-20151129.tar.gz")
md5sums=('decc7c2df08518db8b9bedd01f07e9e9')

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
