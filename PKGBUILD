# Maintainer: Bakasura <bakasura@protonmail.ch>
# Contributor: Tetsumaki <http://goo.gl/YMBdA>

pkgname=abgx360gui
pkgver=1.0.2
pkgrel=4
pkgdesc="A GTK frontend for abgx360"
arch=('i686' 'x86_64')
license=('unknown')
url="http://abgx360.xecuter.com/"
depends=('abgx360' 'wxgtk2.8' 'xterm')
source=(http://abgx360.xecuter.com/dl/${pkgname}-${pkgver}.tar.gz
        abgx360gui.desktop
        abgx360gui.png
        abgx360gui_TopBitmap_XPM.xpm.patch)
sha256sums=('949fdcb871d038b1c8aed658e3d3d0fe6c44c73fbea8defc46ce37b0abf91303'
            '2449af1ef890cf9043971c35576f553c9b6d4f62c08126a70b449dca4d4d5fa0'
            '074bbc00f247042c6ad1c01a02a3f25178572732eae09309aa4078741b1c2aa3'
            'afa5c5c344d4bf9e2d6ff307b8e62aa2734543352cd76140467ad53c0378197a')

build() {
  patch "${srcdir}/${pkgname}-${pkgver}/src/Images/abgx360gui_TopBitmap_XPM.xpm" "${srcdir}/abgx360gui_TopBitmap_XPM.xpm.patch"
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's/http\:\/\/abgx360.net/http\:\/\/abgx360.xecuter.com/g' src/abgx360gui.cpp
  ./configure --prefix=/usr --with-wx-config=/usr/bin/wx-config-2.8
  make
}

package () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -d ${pkgdir}/usr/share/{applications,pixmaps}
  install -m 644 ${startdir}/abgx360gui.desktop ${pkgdir}/usr/share/applications/
  install -m 644 ${startdir}/abgx360gui.png ${pkgdir}/usr/share/pixmaps/
}
