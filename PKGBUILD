# Maintainer: John D Jones III < j n b e k join '',qw(1 9 7 2) AT gmail DOT com>
# Contributor: Lukas Jirkovsky <l DOT jirkovsky AT gmail DOT com>

pkgname=gtk2-theme-sonar
pkgver=11.3.0_70.3
pkgrel=1
pkgdesc="GTK2 theme from openSUSE 11.3"
arch=('any')
url="http://www.opensuse.org/"
license=('GPL')
depends=('gtk-engine-murrine')
makedepends=('rpmextract' 'patch')
source=('http://download.opensuse.org/repositories/GNOME:/Factory/openSUSE_Factory/src/gtk2-metatheme-sonar-11.3.0-70.3.src.rpm' 'metatheme-Sonar_compatibilty-with-murrine-0.98.patch')
md5sums=('b076342ba601497a10934ede5257c2f8'
         'a47da04787410b4c62f406a1c0352c30')

package() {
  cd "$srcdir"

  rpmextract.sh gtk2-metatheme-sonar-${pkgver//_/-}.src.rpm
  tar -xf metatheme-Sonar-${pkgver%_*}.tar.bz2

  patch -p0 -b < "$srcdir"/metatheme-Sonar_compatibilty-with-murrine-0.98.patch
  install -m 755 -d "$pkgdir"/usr/share/themes/Sonar
  cp -a Sonar/gtk-2.0/ "$pkgdir"/usr/share/themes/Sonar
  cp -a Sonar/metacity-1/ "$pkgdir"/usr/share/themes/Sonar
  chmod a-w "$pkgdir"/usr/share/themes/Sonar/metacity-1
  cp -a Sonar/index.theme "$pkgdir"/usr/share/themes/Sonar
  chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
