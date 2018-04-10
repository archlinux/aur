# Maintainer: Simon Doppler (dopsi) <dop.simon_at_gmail.com>

# Former maintaining team :
# (Contributor) Nick B <Shirakawasuna at gmail _dot_com>
# (Maintainer) moostik <mooostik_at_gmail.com>
pkgname=qelectrotech
pkgver=0.6
pkgrel=2
pkgdesc="An electric diagram editor"
arch=('i686' 'x86_64')
url="https://qelectrotech.org/"
license=('GPL2')
depends=('qt5-svg' 'hicolor-icon-theme')
sha512sums=('d7c4b01afd3a2a7bcf31e93b346316eed5101885d469a92504f804f6af997e5b25664b98e8f26b87b7ba9a88c72f72456a1bc87d934744cde7c6ac0fed0951d3'
            '37bda63af55fb422ab5c5950b229cc8a375295a43decffe31522c14e5dcc6dbeb9ca50a36ca40f595458af652cf1e0f46683a97c950b4745c12a1ddd31e28c57')
source=("http://download.tuxfamily.org/qet/tags/20180306/${pkgname}-${pkgver}-src.tar.gz" 'install-dir.patch')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}-src"
	patch -p1 < "${srcdir}/install-dir.patch"
	sed -i 's/gzip \-9n/gzip -9nf/' "${srcdir}/${pkgname}-${pkgver}-src/man/compress_man_pages.sh"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-src"
  qmake-qt5
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-src"
  make INSTALL_ROOT="${pkgdir}" install
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/doc"
}
