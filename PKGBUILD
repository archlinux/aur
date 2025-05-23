# Contributor: 173br <173brian at gmail dot com>
# Maintainer: Tilmann Meyer <tilmann.meyer@gmx.net>

pkgname=aarch64-linux-gnu-meson
pkgver=1
pkgrel=5
arch=('any')
pkgdesc="Meson wrapper for arm64 (aarch64)"
depends=('meson' 'aarch64-linux-gnu-gcc' 'aarch64-linux-gnu-pkg-config')
license=("GPL")
url=""
source=("toolchain_generator.py"
        "aarch64-linux-gnu-meson")
sha256sums=('9cf40a861279be7876d8cac23f43ee8a3a3386a4f8d279f690f6b3e5ccfefbce'
            '84f137d44de0dc62acce59095944fe1802e0d647b3848239059fc111cc9117af')

build() {
  python toolchain_generator.py --output-file toolchain-aarch64-linux-gnu.meson 
}

package() {
  install -d "${pkgdir}"/usr/bin
  install -d "${pkgdir}"/usr/share/aarch64
  install -m 755 "${srcdir}/toolchain_generator.py" "$pkgdir/usr/bin/meson-cross-aarch64-file-generator"
  install -m 755 "${srcdir}/aarch64-linux-gnu-meson" "$pkgdir/usr/bin/aarch64-linux-gnu-meson"
  install -m 644 toolchain-aarch64-linux-gnu.meson "${pkgdir}"/usr/share/aarch64/
}
