# Maintainer: Jeremy Audet <jerebear@protonmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Arnaud Durand-Favreau <biginoz at FREE point FR>
#
# namcap warns that 'java-environment' is a dependency. This is untrue:
# java-runtime suffices. Also, java-runtime provides 'sh'.
#

pkgname=mkgmap
pkgver=r4257
pkgrel=1
pkgdesc='Create maps for Garmin GPS devices from OpenStreetMap (OSM) data.'
url='http://www.mkgmap.org.uk'
license=(GPL2)
arch=(any)
depends=('java-runtime=8')
conflicts=("${pkgname}-svn")
source=("${pkgname}" "http://www.mkgmap.org.uk/download/${pkgname}-${pkgver}.zip")
sha256sums=('135dfbca5146cea34ef48ed6908a817efdfbbcccbb8adfbbb6a100f58c2c7bb6'
            '3020b2ddc204e9ec2a495a40540a76cd55c06ecaf0612d2bb3d7f18840680be8')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install the executable, jarfile, dependencies and man page.
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 \
    "${pkgname}.jar" \
    "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  cp -r lib/ "${pkgdir}/usr/share/java/${pkgname}/"
  install -Dm644 "doc/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

# vim:set ts=2 sw=2 et:
