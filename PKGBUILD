# Mantainer: <mclenin.at.gmail.com>

pkgname=xenonauts-hib
pkgver=1.59
pkgrel=1
pkgdesc="Space invasion strategy game in the X-COM genre"
arch=('i686' 'x86_64')
url="http://www.xenonauts.com/"
license=('Commercial')
depends=('wine')
makedepends=(hib-dlagent)
source=( "xenonauts.desktop" "hib://xenonauts_v1.59_linux.deb")
md5sums=('e213048a9eda9d1e2ed0f3b1cc0ed49f'
         'fc7d3f36fdb5f7f39f273d2574799f53')

DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in makepkg.conf. See http://git.ersoft.org/git/hib-dlagent.git/tree/README ."; exit 1')

package() {
  cd ${srcdir}
  tar -xzf data.tar.gz
  cd opt
  install -dm774 -g games ${pkgdir}/opt/xenonauts
  cp -R xenonauts ${pkgdir}/opt/
  chmod 777 ${pkgdir}/opt/assets/mods

  cd ${srcdir}/usr/bin
  install -Dm755 xenonauts ${pkgdir}/usr/bin/xenonauts
  cd ${srcdir}
  install -Dm644 xenonauts.desktop ${pkgdir}/usr/share/applications/xenonauts.desktop
  cd ${srcdir}/usr/share/pixmaps
  install -Dm644 xenoicon2.png ${pkgdir}/usr/share/pixmaps/xenoicon2.png
  
}
