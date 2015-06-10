# Maintainer: Johannes Lange (<firstname>DOT<lastname>ATcern.ch>)
pkgname=cernbox
pkgver=1.7.2_3.1
pkgrel=2
pkgdesc="Synchronization client for CERN's CERNBox cloud service (based on ownCloud)"
arch=('i686' 'x86_64')
url="http://cernbox.web.cern.ch/"
license=('GPL')
depends=('neon' 'qtwebkit' 'qtkeychain')
provides=('ocsync' 'cernboxsync')

if [ "$CARCH" = "i686" ]; then
   source=(
      http://cernbox-resources.web.cern.ch/cernbox-resources/Linux/repo/openSUSE_13.2/i586/cernbox-client-${pkgver/_/-}.i586.rpm
      http://cernbox-resources.web.cern.ch/cernbox-resources/Linux/repo/openSUSE_13.2/i586/libcernboxsync0-${pkgver/_/-}.i586.rpm
   )
   md5sums=('6e81d85f032302cb135c108f8b02a9c5'
            'd00a13e8e6e032970fc6b34a7aa81be9')

elif [ "$CARCH" = "x86_64" ]; then
   source=(
      http://cernbox-resources.web.cern.ch/cernbox-resources/Linux/repo/openSUSE_13.2/x86_64/cernbox-client-${pkgver/_/-}.x86_64.rpm
      http://cernbox-resources.web.cern.ch/cernbox-resources/Linux/repo/openSUSE_13.2/x86_64/libcernboxsync0-${pkgver/_/-}.x86_64.rpm
   )
   md5sums=('68110fa2ae3ad0e973e46337784c00ff'
            'e5c4c22cbed3962950ae5af93d328afa')
fi

package() {
   cp -dpr "${srcdir}/usr" "${pkgdir}"
   cp -dpr "${srcdir}/etc" "${pkgdir}"
   mkdir "${pkgdir}/usr/share/pixmaps"
   cp "${pkgdir}/usr/share/icons/hicolor/128x128/apps/cernbox.png" "${pkgdir}/usr/share/pixmaps"
   if [ "$CARCH" = "x86_64" ]; then
      mv "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib"
   fi
}
