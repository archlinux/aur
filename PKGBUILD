# Maintainer: thiagoc <root@thiagoc.net>
# https://github.com/thiagoc/aur-packages

pkgname=atraci-bin
pkgver=0.7.0
pkgrel=1
pkgdesc='An application that lets you listen instantly to more than 60 million songs'
arch=('i686' 'x86_64')
url='http://getatraci.net'
license=('MIT')
depends=('gconf' 'libnotify')
optdepends=('libudev.so.0: install it if Atraci does not run correctly')
conflicts=('atraci-git' 'atraci')
options=('!strip')
source_i686=(https://github.com/Atraci/Atraci/releases/download/${pkgver}/Atraci-linux32.tar.gz)
source_x86_64=(https://github.com/Atraci/Atraci/releases/download/${pkgver}/Atraci-linux64.tar.gz)
source=(atraci.desktop
        atraci.install
        atraci.png)
md5sums_i686=('c30ce89dc54a919c92bcc206570319bd')
md5sums_x86_64=('4170610f99a02dd74338a7f4527a7f35')
md5sums=('abb9ee963a310dde90b24250163d1e89'
         '57a030ed14fb00d3df2a74bc499680e9'
         'ca605a2dfdec42b086201731c7315daa')

package() {
  cd ${srcdir}
  install -dm 755 ${pkgdir}/opt/${pkgname}
  install -dm 755 ${pkgdir}/usr/bin
  test "${CARCH}" == 'x86_64' && _pkgarch='64' || _pkgarch='32'
  install -Dm 755 linux${_pkgarch}/Atraci ${pkgdir}/opt/${pkgname}
  install -Dm 644 linux${_pkgarch}/libffmpegsumo.so ${pkgdir}/opt/${pkgname}
  install -Dm 644 linux${_pkgarch}/nw.pak ${pkgdir}/opt/${pkgname}
  install -Dm 644 linux${_pkgarch}/icudtl.dat ${pkgdir}/opt/${pkgname}
  install -Dm 644 atraci.desktop ${pkgdir}/usr/share/applications/atraci.desktop
  install -Dm 644 atraci.png ${pkgdir}/usr/share/pixmaps/atraci.png
  ln -s /opt/${pkgname}/Atraci ${pkgdir}/usr/bin/atraci
}

# vim:set ts=2 sw=2 et:
