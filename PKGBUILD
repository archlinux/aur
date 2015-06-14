# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Created: 08/05/2011

pkgname=nttoolkit
_pkgname=nttoolkit_v200_linux_setup.bin
pkgver=2.0
pkgrel=1
pkgdesc='Utilities designed to help network administrators with their daily administrative tasks (on linux limited version)'
arch=('i686' 'x86_64')
url='http://www.netikus.net/products_nttoolkit.html'
license=('custom:NTToolKit')
depends=(unixodbc qt gksu)
install=${pkgname}.install
source=("http://www.netikus.net/downloads/products/nttoolkit/nttoolkit_v200_linux_setup.bin"
  "${pkgname}.desktop"
  "license.txt")

build(){
  cd "$srcdir"
  install -dm775 ${pkgdir}/opt/nttoolkit || return 1
  chmod +x ${_pkgname}
  ./${_pkgname} --prefix ${pkgdir}/opt/nttoolkit --mode unattended || return 1
  #cleaning
  rm -rf ${pkgdir}/opt/${pkgname}/{rollbackBackupDirectory,uninstall,Uninstall\ NTToolKit.desktop,libQ*} || return 1
  install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop || return 1
  install -Dm644 license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE || return 1
  install -dm755 ${pkgdir}/usr/bin/ || return 1
  cd ${pkgdir}/usr/bin || return 1
  ln -svn ../../opt/${pkgname}/ipmon || return 1
  ln -svn ../../opt/${pkgname}/ipmonplus || return 1
}

# vim:set ts=2 sw=2 et ft=sh tw=100:
md5sums=('2322482047bd2182c22a392107d3d5b6'
         '185d64aaf4cec45ef5cddded57cae369'
         '8f723f4be3e98e88b27487b07c9aa820')
