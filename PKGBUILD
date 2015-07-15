# Contributer: giacomogiorgianni@gmail.com 

pkgname=belle
_name=Belle
pkgver=0.5
pkgrel=2
pkgdesc="Qt Graphic Editor"
arch=(i686 x86_64)
url="http://opendesktop.org/content/show.php/Belle?content=155259"
license=('GPL')
depends=('qt4')
#source=("http://opendesktop.org/CONTENT/content-files/155259-${_name}-${pkgver}a.tar.gz" "${pkgname}.desktop")
#source=(http://download.savannah.gnu.org/releases/${pkgname}/${_name}_${pkgver}a-src.tar.gz "${pkgname}.desktop")
source=("https://github.com/fr33mind/Belle/archive/${pkgver}a.tar.gz" "${pkgname}.desktop")

md5sums=('2ae62f9a8e1f79790a987050006a82e1'
         '4ee8afc35b6c725e6be1e720d00ad3fc')

package() {
  cd "$srcdir/${_name}-${pkgver}a"

  qmake-qt4 editor/$pkgname.pro -r -config release \
    "CONFIG+=LINUX_INTEGRATED" \
    "INSTALL_ROOT_PATH=$pkgdir/usr/" \
    "LOWERED_APPNAME=$pkgname"
  make
  install -D -m755 $pkgname ${pkgdir}/usr/bin/$pkgname
  install -D -m644 ${srcdir}/$pkgname.desktop \
		${pkgdir}/usr/share/applications/$pkgname.desktop
  #make
  #make INSTALL_ROOT=${pkgdir} install
}
