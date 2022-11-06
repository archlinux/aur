# Maintainer: aksr <aksr at t-com dot me>
pkgname=cwebx
_pkgname=cweb
pkgver=3.52
_pkgver=x3.52
pkgrel=2
pkgdesc="The CWEBx system for Structured Software Documentation (Literate Programming) in C."
arch=(any)
url="http://wwwmathlabo.univ-poitiers.fr/~maavl/CWEBx/"
license=(MIT)
depends=('texlive-core')
install=cweb.install
source=("http://wwwmathlabo.univ-poitiers.fr/~maavl/CWEBx/$_pkgname-$_pkgver.tgz" LICENCE)
md5sums=('30fadade903fd110eb4478962ab21016'
         '722d196a53e0c3e6616aba9003aa181f')
sha1sums=('5d087aa6413bdce69f1cf16c797779ace5c3e086'
          'f995c1aa3d0ed71cf7b2dc869de4921867d1db55')
sha256sums=('92e57b4414388743bd0b91d81c91bea4645a8b04c8f744754b0855e90934186b'
            '4aa9a73b3aa7e566651e7110c4a301e4294b78dfa7cac07347db18c77652e96b')

build() {
	cd "$srcdir/$_pkgname-$_pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$_pkgname-$_pkgver"
	make -k check
}

package() {
	cd "$srcdir/$_pkgname-$_pkgver"
	mkdir -p $pkgdir/usr/{share/doc/$pkgname,share/man/man1,share/texmf/tex/cwebx}
	install -D -m755 cweavex $pkgdir/usr/bin/cweavex
	install -D -m755 ctanglex $pkgdir/usr/bin/ctanglex
	install -D -m755 ctanglex $pkgdir/usr/bin/ctanglex
	install -D -m644 README $pkgdir/usr/share/doc/$pkgname/README
	install -D -m644 cweave.dvi $pkgdir/usr/share/doc/$pkgname/cweave.dvi
	install -D -m644 ctangle.dvi $pkgdir/usr/share/doc/$pkgname/ctangle.dvi
	install -D -m644 common.dvi $pkgdir/usr/share/doc/$pkgname/common.dvi
	install -D -m644 manual.dvi $pkgdir/usr/share/doc/$pkgname/manual.dvi
	install -D -m644 man1/cweb.1 $pkgdir/usr/share/man/man1/cwebx.1
	install -D -m644 cwebcmac.tex $pkgdir/usr/share/texmf/tex/cwebx/cwebcmac.tex
	install -D -m644 cwebhmac.tex $pkgdir/usr/share/texmf/tex/cwebx/cwebhmac.tex
	install -D -m644 cwebxmac.tex $pkgdir/usr/share/texmf/tex/cwebx/cwebxmac.tex
	cp -r --no-preserve=ownership,mode examples $pkgdir/usr/share/doc/$pkgname/examples
	install -D -m644 cwebxmac.tex $pkgdir/usr/share/texmf/tex/cwebx/cwebxmac.tex
	install -D -m644 $srcdir/LICENCE $pkgdir/usr/share/licenses/$pkgname/LICENCE
}
