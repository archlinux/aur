# Maintainer: Konstantin Liberty <jon9097 at gmail dot com>

pkgname=obs-multi-rtmp-bin
pkgver=0.7.3.2
pkgrel=1
pkgdesc="Multiple RTMP outputs plugin for OBS Studio (prebuilt binaries from upstream)"
arch=('x86_64')
url="https://github.com/sorayuki/obs-multi-rtmp"
license=('GPL-2.0-only')
depends=('obs-studio')
makedepends=('binutils')

provides=('obs-multi-rtmp')
conflicts=('obs-multi-rtmp' 'obs-multi-rtmp-git')

source=("${pkgname}-${pkgver}.deb::${url}/releases/download/${pkgver}/obs-multi-rtmp-0.7.3.0-x86_64-linux-gnu.deb")

# The package author made a mistake in the package numbering. Therefore, I'm still numbering manually.
# source=("${pkgname}-${pkgver}.deb::${url}/releases/download/${pkgver}/obs-multi-rtmp-${pkgver}.0-x86_64-linux-gnu.deb")


sha512sums=('4201ec22596a10ab15969791b23a463324d23067773278c5eabf6e1efbc3cc92c60945af28aaba94630de35a29c1d2e7b6a5bcb9f3aaa4a3b934e8a5fc39495b')

prepare() {
  cd "${srcdir}"
  bsdtar -xf data.tar.*
}

package() {
  cd "${pkgdir}"

  install -d usr/lib/obs-plugins
  install -d usr/share/obs/obs-plugins/obs-multi-rtmp

  cp -a "${srcdir}"/usr/lib/x86_64-linux-gnu/obs-plugins/. usr/lib/obs-plugins/
  cp -a "${srcdir}"/usr/share/obs/obs-plugins/obs-multi-rtmp/. \
        usr/share/obs/obs-plugins/obs-multi-rtmp/
}
