# Maintainer: Simon Doppler (dopsi) <dop.simon_at_gmail.com>

# Former maintaining team :
# (Contributor) Nick B <Shirakawasuna at gmail _dot_com>
# (Maintainer) moostik <mooostik_at_gmail.com>
pkgname=qelectrotech
pkgver=0.61
pkgrel=2
pkgdesc="An electric diagram editor"
arch=('i686' 'x86_64')
url="https://qelectrotech.org/"
license=('GPL2')
depends=('qt5-svg' 'hicolor-icon-theme' 'desktop-file-utils')
sha512sums=('b07d28520bef5773f5f93595c53a839a160c5927a7534ec30eba451fd33ab090909fc1971f28aea53538ff8e20ca45eff0b6597f3ab103b00b89eaa65067f918'
            '37bda63af55fb422ab5c5950b229cc8a375295a43decffe31522c14e5dcc6dbeb9ca50a36ca40f595458af652cf1e0f46683a97c950b4745c12a1ddd31e28c57')
source=("http://download.tuxfamily.org/qet/tags/20180823/${pkgname}-${pkgver}-src.tar.gz" 'install-dir.patch')

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
