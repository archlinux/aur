# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Arnaud Durand-Favreau <biginoz at FREE point FR>
#
# namcap warns that 'java-environment' is a dependency. This is untrue:
# java-runtime suffices. Also, java-runtime provides 'sh'.
#

pkgname=mkgmap
pkgver=r3792
pkgrel=1
pkgdesc='Create maps for Garmin GPS devices from OpenStreetMap (OSM) data.'
url='http://www.mkgmap.org.uk'
license=(GPL2)
arch=(any)
depends=('java-runtime=8')
conflicts=("${pkgname}-svn")
source=("$pkgname" "http://www.mkgmap.org.uk/download/${pkgname}-${pkgver}.zip")
sha256sums=('135dfbca5146cea34ef48ed6908a817efdfbbcccbb8adfbbb6a100f58c2c7bb6'
            'd0fd79e9363a662e6bd637ae56bd796b0cbc5e7b17e74c56b1a67a702fa00b4f')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install the executable, jarfile, dependencies and man page.
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 \
    "${pkgname}.jar" \
    "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  cp -r lib/ "${pkgdir}/usr/share/java/${pkgname}/"
  install -Dm644 "doc/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

# vim:set ts=2 sw=2 et:
