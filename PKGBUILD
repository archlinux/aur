# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: LTSmash <lord.ltsmash@gmail.com>
# Contributor: Zauber Exonar <zauberexonar at gmail>
# Contributor: GordonGR <ntheo1979@gmail.com>
pkgname=opensimulator-osgrid
pkgver=20221227.v0.9.2.3422ae3
_realpkgver=12272022.v0.9.2.3422ae3
pkgrel=1
pkgdesc="OSGrid's distribution of OpenSimulator, preconfigured to connect with OSGrid"
arch=('i686' 'x86_64')
url="https://www.osgrid.org"
license=('BSD')
depends=('mono' 'sqlite')
makedepends=('unzip')
install=${pkgname}.install
backup=("opt/${pkgname}/bin/OpenSim.ini"
  "opt/${pkgname}/bin/config-include/GridCommon.ini")
source=("https://danbanner.onikenkon.com/osgrid/osgrid-opensim-${_realpkgver}.zip"
  "osgrid.sh")
sha512sums=('9be067af0cdeac05e07762ed9a88bebb25f9b3fb5371198b11078e25e30a63064d4763d93d52cbdc6bfb5318aa782167ceda25ea16fa990edd85682706948dad'
  'fcf960e3b93959813e44bab5b3d1c569d5f560537391dfa021f0be6be4e5cbdcbf242f7f5ebec96b17d81e84312bbe1a3c3cf8b2e74d6ecf610749d639c6b9e5')

package() {
  cd bin
  #copying Mono.Posix.dll so that OpenSimulator can use sockets, and by extension MySQL
  cp /usr/lib/mono/4.5-api/Mono.Posix.dll Mono.Posix.dll
  # install
  install -d ${pkgdir}/opt/${pkgname}/bin
  cp -r ./* ${pkgdir}/opt/${pkgname}/bin/
  # set permissions
  find ${pkgdir}/opt/${pkgname}/bin -type d -exec chmod 755 {} +
  find ${pkgdir}/opt/${pkgname}/bin -type f -exec chmod 644 {} +
  find ${pkgdir}/opt/${pkgname}/bin -name "*.exe" -exec chmod 755 {} +
  find ${pkgdir}/opt/${pkgname}/bin -name "*.ini" -exec chmod 666 {} +
  find ${pkgdir}/opt/${pkgname}/bin -name "*.xml" -exec chmod 666 {} +
  chmod 777 ${pkgdir}/opt/${pkgname}/bin/{,*/}
  chmod 755 ${pkgdir}/opt/${pkgname}/bin/opensim.sh
  # chmod 666 "${pkgdir}"/opt/${pkgname}/bin/OpenSim.log
  # install launch script
  install -m755 -D ../osgrid.sh ${pkgdir}/usr/bin/osgrid
}
