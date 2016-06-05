# Maintainer: Johannes Lange (<firstname>DOT<lastname>ATcern.ch>)
pkgname=cernbox
pkgver=1.7.2_3.1
pkgrel=3
pkgdesc="Synchronization client for CERN's CERNBox cloud service (based on ownCloud)"
arch=('i686' 'x86_64')
url="http://cernbox.web.cern.ch/"
license=('GPL')
depends=('neon' 'qtwebkit')
provides=('ocsync' 'cernboxsync')

if [ "$CARCH" = "i686" ]; then
   source=(
      http://cernbox-resources.web.cern.ch/cernbox-resources/Linux/repo/openSUSE_13.2/i586/cernbox-client-${pkgver/_/-}.i586.rpm
      http://cernbox-resources.web.cern.ch/cernbox-resources/Linux/repo/openSUSE_13.2/i586/libcernboxsync0-${pkgver/_/-}.i586.rpm
      http://cernbox-resources.web.cern.ch/cernbox-resources/Linux/repo/openSUSE_13.2/i586/libqtkeychain0-0.4-8.1.i586.rpm
      cernbox
      cernboxcmd
   )
   md5sums=(
     '6e81d85f032302cb135c108f8b02a9c5'
     'd00a13e8e6e032970fc6b34a7aa81be9'
     'a013910e30cf66b5b113c47ee0b895fc'
     '911d014c0670d3bf7cbc622f00206339'
     '83a60fef4c5f69b2ed91605db490a955'
   )

elif [ "$CARCH" = "x86_64" ]; then
   source=(
      http://cernbox-resources.web.cern.ch/cernbox-resources/Linux/repo/openSUSE_13.2/x86_64/cernbox-client-${pkgver/_/-}.x86_64.rpm
      http://cernbox-resources.web.cern.ch/cernbox-resources/Linux/repo/openSUSE_13.2/x86_64/libcernboxsync0-${pkgver/_/-}.x86_64.rpm
      http://cernbox-resources.web.cern.ch/cernbox-resources/Linux/repo/openSUSE_13.2/x86_64/libqtkeychain0-0.4-8.1.x86_64.rpm
      cernbox
      cernboxcmd
   )
   md5sums=(
     '68110fa2ae3ad0e973e46337784c00ff'
     'e5c4c22cbed3962950ae5af93d328afa'
     '292f7710439c7a272acf16091be69ae4'
     '911d014c0670d3bf7cbc622f00206339'
     '83a60fef4c5f69b2ed91605db490a955'
   )
fi

package() {
   cp -dpr "${srcdir}/usr" "${pkgdir}"
   cp -dpr "${srcdir}/etc" "${pkgdir}"
   mkdir -p "${pkgdir}/usr/share/pixmaps"
   cp "${pkgdir}/usr/share/icons/hicolor/128x128/apps/cernbox.png" "${pkgdir}/usr/share/pixmaps"
   if [ "$CARCH" = "x86_64" ]; then
      mv "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib"
   fi
   mv "${pkgdir}/usr/bin/cernbox" "${pkgdir}/usr/lib/cernbox/"
   mv "${pkgdir}/usr/bin/cernboxcmd" "${pkgdir}/usr/lib/cernbox/"
   mv "${pkgdir}/usr/lib/libqtkeychain.so.0" "${pkgdir}/usr/lib/cernbox/"
   mv "${pkgdir}/usr/lib/libqtkeychain.so.0.4.0" "${pkgdir}/usr/lib/cernbox/"
   # wrapper scripts
   cp -p "${srcdir}/cernbox" "${pkgdir}/usr/bin"
   cp -p "${srcdir}/cernboxcmd" "${pkgdir}/usr/bin"
}
