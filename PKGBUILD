# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Maintainer: Jaime Martínez Rincón <jaime@jamezrin.name> https://github.com/jamezrin

pkgname=toptracker
_pkgver=1.6.0-334
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Time tracking software for remote teams and individuals"
arch=(x86_64)
url="https://www.toptal.com/tracker/"
license=(custom:toptracker)
depends=(qt5-svg qt5-multimedia libxss gtk3 libappindicator-gtk2)
source=("https://d101nvfmxunqnl.cloudfront.net/desktop/builds/redhat/${pkgname}_${_pkgver}_x86_64.rpm"
        'toptracker.desktop'
        'toptracker-LICENSE')
noextract=("${pkgname}_${_pkgver}_x86_64.rpm")
sha256sums=('212f82bc574c741b1c8837ae5d06b2999d15d6c431ef8d41cf096653d877b95c'
            '99730f7b360235a8f27a50fbc148b71dd0ef54526d2ccb563495f3ee1f75ac80'
            '3a12e2c5bd4c992b24320e1e2552476f21d08229417ca298cb39a2512f36162e')

package() {
  bsdtar -xf ${srcdir}/${pkgname}_${_pkgver}_x86_64.rpm -C ${pkgdir}/
  rm -r ${pkgdir}/etc/yum.repos.d
  rm ${pkgdir}/etc/cron.daily/toptracker.cron
  rm ${pkgdir}/usr/share/applications/toptracker.desktop
  install -Dm755 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications
  install -Dm644 ${srcdir}/${pkgname}-LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
