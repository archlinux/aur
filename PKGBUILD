# Contributor: Sergio Montesinos <sermonpe@yahoo.es>

pkgname=rosa-icons
pkgver=1.0.42
pkgrel=1
pkgdesc="ROSA icons theme."
arch=('any')
url="http://www.rosalinux.com"
license=('GPL')
depends=('gnome-icon-theme')
makedepends=('inkscape')
source=("http://mirror.yandex.ru/rosa/rosa2012.1/repository/SRPMS/main/updates/${pkgname}-${pkgver}-1.src.rpm")
md5sums=('1a7ec3e5b355ca3ddc1389be1c3aaed4')
package() {
  install -dm755 "${pkgdir}/usr/share/icons"
  tar --no-same-owner -Jxf "${srcdir}/rosa-${pkgver}.tar.xz" -C "${pkgdir}/usr/share/icons"
  # A hack from rosa-icons.spec
  # An ugly hack to work with Ikscape.
  # TODO: Neccessary find a real problem!
  cd "${pkgdir}/usr/share/icons/rosa-${pkgver}/places/16"
  for i in `ls`
  do
    echo "Converting $i to plain SVG."
    inkscape -l $i $i
  done
  # devices icons should be converted too
  cd "${pkgdir}/usr/share/icons/rosa-${pkgver}/devices/16"
  for i in `ls`
  do
    echo "Converting $i to plain SVG."
    inkscape -l $i $i
  done

#  cd "${pkgdir}/usr/share/icons/rosa-${pkgver}"
#  fdupes -s "${pkgdir}/usr/share/icons/rosa-${pkgver}"

}
