# Maintainer: Matthias Mailänder <matthias [at] mailaender [dot] name>

pkgname=eclipse-rcp
epoch=2
pkgver=4.29
pkgrel=1
_release=2023-09/R
pkgdesc="IDE for Rich Client Platform (RCP) and Remote Application Platform (RAP)"
arch=('x86_64')
url="https://eclipse.org/ide"
license=('EPL')
depends=('java-environment>=17')
provides=(eclipse=$pkgver-$pkgrel)
conflicts=(eclipse)

_srcfilename="$pkgname-${_release//\//-}-linux-gtk-$CARCH.tar.gz"
source=("$_srcfilename::https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/$_release/$_srcfilename&r=1"
        "eclipse.desktop::https://git.eclipse.org/c/linuxtools/org.eclipse.linuxtools.eclipse-build.git/plain/desktopintegration/eclipse.desktop?h=f20")
sha512sums=('9e540d551fe6ba9a8f298cf9c18a3c40cb25299347e8caf5e3349b5d56b7a6275c05808e82fb41b68c93721224cdc8c12256901df08e57b0e4478b37055c7b4a'
            'e1ef156793d844ab20e38b0ea055836a0732005657556eee85ae337d0ed4242cd204a0c62709b505454ac7ae7c2235d2ef286252855728c79cf66e77b97041a0')

backup=('usr/lib/eclipse/eclipse.ini')

package() {
  install -d "${pkgdir}/usr/lib"
  cp -r "eclipse" "${pkgdir}/usr/lib/eclipse"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/eclipse/eclipse" "${pkgdir}/usr/bin/eclipse"
  
  install -Dm0644 "eclipse.desktop" "${pkgdir}/usr/share/applications/eclipse.desktop"
  
  for i in 16 22 24 32 48 64 128 256 512 1024 ; do
      install -Dm0644 eclipse/plugins/org.eclipse.platform_${pkgver}*/eclipse$i.png \
          "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/eclipse.png"
  done
}
