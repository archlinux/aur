# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=yafaray-blender-exporter
pkgver=3.3.0
_blenderver=2.79
pkgrel=1
pkgdesc="YafaRay's Blender Exporter"
arch=('any')
url="http://yafaray.org/"
license=('GPL2')
depends=('blender' 'yafaray')
source=("https://github.com/YafaRay/Blender-Exporter/archive/v${pkgver}.tar.gz"
        "paths.patch")
md5sums=('b1eb1bb0eb56541c6c1990f02b15603f'
         '365aea227d63bc87283c80f563e4910c')

prepare() {
  cd "${srcdir}/Blender-Exporter-${pkgver}"

  patch -Np1 < "${srcdir}/paths.patch"
}

package() {
  cd "${srcdir}/Blender-Exporter-${pkgver}"

  sed -i "s/@YAFARAY_BLENDER_EXPORTER_VERSION@/v${pkgver}/" __init__.py

  install -dm755 "${pkgdir}/usr/share/blender/${_blenderver}/scripts/addons"
  cp -a . "${pkgdir}/usr/share/blender/${_blenderver}/scripts/addons/yafaray_v3"
  rm "${pkgdir}/usr/share/blender/${_blenderver}/scripts/addons/yafaray_v3/.gitignore"
  install -dm755 "${pkgdir}/usr/share/yafaray-blender-exporter"
  mv "${pkgdir}/usr/share/blender/${_blenderver}/scripts/addons/yafaray_v3/tests" \
    "${pkgdir}/usr/share/yafaray-blender-exporter"
  install -dm755 "${pkgdir}/usr/share/doc/yafaray-blender-exporter"
  for _file in CHANGELOG INSTALL LICENSES README; do
    mv "${pkgdir}/usr/share/blender/${_blenderver}/scripts/addons/yafaray_v3/${_file}" "${pkgdir}/usr/share/doc/yafaray-blender-exporter/"
  done
}
