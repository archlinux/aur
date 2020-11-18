# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=mouseserver-bin
_pkgname=${pkgname%-bin}
pkgver=1.0.2
pkgrel=1
pkgdesc="Mouse Server for Linux"
arch=('x86_64')
url="http://wifimouse.necta.us/"
license=('custom')
depends=('gtk2' 'libxtst')
provides=("${_pkgname}" 'wifimouse')
conflicts=(${_pkgname})
source=(${_pkgname}-${pkgver}.deb::"http://wifimouse.necta.us/apk/mouseserver-64.deb"
        "LICENSE.htm::http://wifimouse.necta.us/WiFiMousePrivacy.htm")
sha256sums=('194859ddd305a98f0d7554cdc8beee174d1b253450d42343e3819c3a8a951340'
            'SKIP')

build() {
  install -dm755 build
  tar -xf data.tar.gz -C build
}

package() {
  # binary
  install -Dm755 ${srcdir}/build/usr/sbin/${_pkgname} -t ${pkgdir}/usr/bin

  # desktop
  install -Dm644 ${srcdir}/build/usr/share/applications/${_pkgname}.desktop -t ${pkgdir}/usr/share/applications
  sed -i 's|/usr/sbin/||g' ${pkgdir}/usr/share/applications/${_pkgname}.desktop

  # autostart
  install -Dm644 ${srcdir}/build/usr/share/gnome/autostart/${_pkgname}.desktop -t ${pkgdir}/etc/xdg/autostart/
  sed -i 's|/usr/sbin/||g' ${pkgdir}/etc/xdg/autostart/${_pkgname}.desktop

  # icon
  cp -r ${srcdir}/build/usr/share/mouseserver/ ${pkgdir}/usr/share

  # LICENSE
  install -Dm644 ${srcdir}/LICENSE.htm -t ${pkgdir}/usr/share/licenses/${pkgname}
}

# vim: set sw=2 ts=2 et:
