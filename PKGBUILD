# Maintainer: Will Price <will.price94+aur@gmail.com>

pkgname=floola
pkgver=2012r1
pkgrel=2
pkgdesc="Freeware application to efficiently manage your iPod or your Motorola mobile phone (any model supporting iTunes except iPhone, iPod touch)."
url="http://www.floola.com/"
license=('custom')
makedepends=('rpmextract')
arch=('i686' 'x86_64')
if [ ${CARCH} = 'x86_64' ]; then
  depends=('lib32-libpng12>=1.2.12' 'lib32-libstdc++5' 'lib32-gtk2' 'lib32-gtk-engines')
else
  depends=('libpng12>=1.2.12' 'libstdc++5' 'gtk2')
fi
source=(floola.desktop
        floola-64.sh
        floola.sh
        http://download.schoonzie.com/Floola-linux.tar.gz
        http://www.floola.com/home/wp-content/themes/default/images/icon/128x128.png)
md5sums=('097b6509a3acb6bb8ff048e45ac5d9ca'
         'c4ca5276f636c5587b2652ebf8107ed1'
         '69cd82ab1ec53bf89709a599a97687bd'
         'c3d613ec7cdf7c6db36fa75940e69bae'
         'a261d71d1bc29a85b0bb647d76b61bfe')
optdepends=('gstreamer0.10: GStreamer Multimedia Framework' 
            'libnotify: Desktop notification library')

package() {
  mkdir -p "${pkgdir}/usr/share/"{floola,pixmaps,applications}
  mkdir -p "${pkgdir}/usr/bin"

  install "${srcdir}/128x128.png" "${pkgdir}/usr/share/pixmaps/floola.png"
  install "${srcdir}/floola.desktop" "${pkgdir}/usr/share/applications"
  cp -R "${srcdir}"/Floola/* "${pkgdir}/usr/share/floola/"
  
  if [ $CARCH = 'x86_64' ]; then
    install "${srcdir}/floola-64.sh" "${pkgdir}/usr/bin/floola"
  else
    install "${srcdir}/floola.sh" "${pkgdir}/usr/bin/floola"
  fi
}

# vim:set ts=2 sw=2 et:
