# Maintainer: Zeph <zeph33@gmail.com>

pkgname=easea
pkgver=1.0.3
pkgrel=2
pkgdesc="EASEA (EAsy Specification of Evolutionary Algorithms) is an Artificial Evolution platform that allows with only basic skills in computer science to implement evolutionary algorithms and to exploit the massive parallelism of many-core architecture"
arch=('x86_64' 'i686')
url="http://easea.unistra.fr/"
license=('AGPL3')
install=easea.install
depends=('gcc-libs' 'perl' 'bash' 'java-environment')
makedepends=('gcc>4.4', 'cuda>4.1', 'make>3', 'texlive-bin')
options=('staticlibs')

source=('http://optimate.dl.sourceforge.net/project/easea/EASEA%20for%20UNIX/1.0.3/easea-1.0.3.tar.gz' 'easea.sh')
md5sums=('4241a503b277e753c0175b13ff525767' '58501918cbb27ddc97d806091f2d4b1d')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
	cd "$srcdir/$pkgname-$pkgver/doc"
	pdflatex easea_manual.tex
}

package() {
	cd "$pkgdir"
	mkdir -p opt/easea/ opt/easea/bin opt/easea/tpl opt/easea/libeasea/include opt/easea/boost opt/easea/easeagrapher/ opt/easea/samples opt/easea/doc
	cd "$srcdir/$pkgname-$pkgver"
	cp bin/easea $pkgdir/opt/easea/bin/
	cp tpl/* $pkgdir/opt/easea/tpl/
	cp libeasea/include/* $pkgdir/opt/easea/libeasea/include/
	cp libeasea/libeasea.a $pkgdir/opt/easea/libeasea/
	cp boost/program_options.a $pkgdir/opt/easea/boost
	cp -r boost/boost/ $pkgdir/opt/easea/boost/boost/
	cp easeagrapher/EaseaGrapher.jar $pkgdir/opt/easea/easeagrapher/
	cp -r examples/* $pkgdir/opt/easea/samples/
	cp doc/easea_manual.pdf $pkgdir/opt/easea/doc/easea_manual.pdf
	install -Dm755 "${srcdir}/easea.sh" "${pkgdir}/etc/profile.d/easea.sh"
}

