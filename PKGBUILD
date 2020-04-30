# Maintainer: Jaime Martínez Rincón <jaime@jamezrin.name> https://github.com/jamezrin
# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=toptracker
_pkgver=1.6.2-342
pkgver=${_pkgver//-/.}
pkgrel=2.1
pkgdesc="Time tracking software for remote teams and individuals"
arch=(x86_64)
url="https://www.toptal.com/tracker/"
license=(custom:toptracker)
depends=(qt5-base qt5-svg qt5-multimedia libxss gtk3 libappindicator-gtk2)
source=("https://d101nvfmxunqnl.cloudfront.net/desktop/builds/redhat/${pkgname}_${_pkgver}_x86_64.rpm"
        'toptracker.desktop'
        'toptracker-LICENSE'
        'toptracker-launcher')
noextract=("${pkgname}_${_pkgver}_x86_64.rpm")
sha256sums=('e064e0a6cc5596eca82278f51f971fb35241b5bc71dc8ee2d7520291b392de5c'
            'e65278708e76a1e3772ccdecb1710d59a492a88ee6c3fde87296cccaec79b9cd'
            '3a12e2c5bd4c992b24320e1e2552476f21d08229417ca298cb39a2512f36162e'
            'daed1bd315d68a2755e6f13126482eef18c361306c62cb6219be6c39ee64af34')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons"

  bsdtar -xf ${srcdir}/${pkgname}_${_pkgver}_x86_64.rpm -C ${pkgdir}/
  rm -r ${pkgdir}/etc/yum.repos.d
  rm ${pkgdir}/etc/cron.daily/toptracker.cron
  rm ${pkgdir}/usr/share/applications/toptracker.desktop
  unlink ${pkgdir}/usr/bin/toptracker

  # Use system libraries
  rm -r ${pkgdir}/opt/toptracker/plugins
  rm -r ${pkgdir}/opt/toptracker/lib
  rm ${pkgdir}/opt/toptracker/bin/qt.conf

  cp ${pkgdir}/opt/toptracker/icon.png ${pkgdir}/usr/share/icons/${pkgname}.png
  install -Dm755 ${srcdir}/${pkgname}-launcher ${pkgdir}/usr/bin/toptracker
  install -Dm755 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications
  install -Dm644 ${srcdir}/${pkgname}-LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

