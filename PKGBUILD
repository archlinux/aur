# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: swordfeng swordfeng123@gmail.com
# Contributor: TheGoliath hidden

pkgname=cajviewer
pkgver=1.0.3.0
pkgrel=1
pkgdesc="Document Viewer for TEB, CAJ, NH, KDH and PDF format"
arch=('x86_64')
url="http://cajviewer.cnki.net/"
license=('custom')
# depends=('wine' 'winetricks' 'bash' 'coreutils')
source=("https://download.cnki.net/cajviewer_1.0.3.0_amd64.deb"
        "${pkgname}.sh"
        "${pkgname}.desktop")
# strip will cause cajviewer core dumped 
options=('!strip')
sha256sums=('73877afd80d297cf26f72389e417a1fc8e29c4de97285fb7b5b383eb84c16fca'
            'cd57be755bb82380b08a29ec3ce4d7e840863d87097e6adba46b3cd61c0a17e3'
            '36e18908e5f7a630059fc653684084df65dbe0c5a9239f82ef7e677224674786')

_install() {
  find ${@: 2} -type f -exec install -Dm$1 {} ${pkgdir}/{} \;
}

prepare() {
  install -dm755 build
  tar -xf data.* -C build
}

package() {
  cd "$srcdir/build"
  
  # binary wrapper
  install -Dm755 ${srcdir}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}

  _install 755 opt/${pkgname}/bin/${pkgname}
  # _install 644 opt/${pkgname}/bin/platforms
  _install 644 opt/${pkgname}/bin/Resource
  _install 644 opt/${pkgname}/bin/qt.conf

  _install 644 opt/${pkgname}/lib
  _install 644 opt/${pkgname}/plugins
  # _install 644 opt/${pkgname}/share 
  _install 644 opt/${pkgname}/translations

  # mime
  install -Dm644 opt/${pkgname}/cnki-caj.xml -t ${pkgdir}/usr/share/mime/packages/

  install -Dm644 ${srcdir}/${pkgname}.desktop -t ${pkgdir}/usr/share/applications
  install -Dm644 opt/${pkgname}/${pkgname}.png -t ${pkgdir}/usr/share/pixmaps
}

# vim: set sw=2 ts=2 et:
