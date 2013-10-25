# $Id: PKGBUILD 67819 2012-03-14 16:22:14Z spupykin $
# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-pdf-mupdf
pkgver=0.2.5
pkgrel=1
pkgdesc="Adds pdf support to zathura by using the mupdf library"
arch=('i686' 'x86_64')
url="https://pwmt.org/projects/zathura/plugins/zathura-pdf-mupdf/"
license=('custom')
depends=('mupdf>=1.3' 'zathura'
	 'jbig2dec' 'openjpeg')
conflicts=('zathura-pdf-poppler')
source=("https://pwmt.org/projects/zathura/plugins/download/$pkgname-$pkgver.tar.gz")
md5sums=('42dcdf2511ffc8f87ca6baba6c566f91')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  sed -i 's|openjp2|openjpeg|g' config.mk
}

build() {
  make -C "${srcdir}/$pkgname-$pkgver"
}

package(){
  make -C "${srcdir}/$pkgname-$pkgver" DESTDIR="$pkgdir" install
  install -Dm0644 "${srcdir}/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
