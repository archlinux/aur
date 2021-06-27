# Maintainer: samarthj <dev@samarthj.com>
# Packaging binary release from creator's release assests
# Building via python has an issue with cloudflare due to a urllib3 dependency
# https://github.com/mikf/gallery-dl/issues/1117
# This binary release pushes this burden of dependency version resolution to the creator

pkgname=gallery-dl-bin
pkgver=1.18.0
pkgrel=1
url='https://github.com/mikf/gallery-dl'
pkgdesc='Command-line program to download image-galleries and collections from several image hosting sites (bin)'
arch=('x86_64')
depends=('zlib')
provides=('gallery-dl')
conflicts=('gallery-dl' 'gallery-dl-git')
license=(GPL2)
source=("${url}"/releases/download/v"${pkgver}"/gallery-dl.bin{,.sig}
  https://api.github.com/repos/mikf/gallery-dl/releases/latest)
validpgpkeys=('3E09F5908333DD83DBDCE7375680CA389D365A88')
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}"
  chmod +x gallery-dl.bin
  grep -oP 'https://.*gallery-dl.bin' latest |
    head -n1 |
    sed -re 's|.*/v(.*)/gallery-dl.bin|\1|g'
}

package() {
  cd "${srcdir}"
  install -Dm0775 gallery-dl.bin "${pkgdir}"/usr/bin/gallery-dl
}
