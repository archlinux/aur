# Maintainer: Bernhard Jaud <itsme+aur at genuineparts dot org>
pkgname=powermiao8k-dkms
pkgver=1.0.0
pkgrel=1
pkgdesc="DKMS kernel driver for the the Angry Miao INFINITY 8K Mouse battery and Dock (3151:5007)"
arch=('x86_64')
url="https://github.com/TsFreddie/powermiao8k"
license=('GPL2')
depends=('dkms')
makedepends=('git')
source=(
"git+https://github.com/TsFreddie/powermiao8k.git#tag=v${pkgver}"
"dkms.conf"
"Makefile"
)
sha256sums=(
'SKIP'
'e3c7f32df73763fa90680720a1d213d9d62f8de5a1ba455818c22c66e92d70cd'
'a2c59cb89fcf0400af4fe1406148498c067f015136d0d7fffcd5eab4e5322488'
)

package() {

  install -Dm644 dkms.conf\
    "${pkgdir}/usr/src/powermiao8k-${pkgver}/dkms.conf"

  install -Dm644 Makefile \
    "${pkgdir}/usr/src/powermiao8k-${pkgver}/Makefile"

  cd "${srcdir}/powermiao8k"

  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  cd "${srcdir}/powermiao8k/src"

  install -Dm644 powermiao8k.c \
    "${pkgdir}/usr/src/powermiao8k-${pkgver}/powermiao8k.c"


  cd "${srcdir}/powermiao8k/packaging"

  install -Dm644 99-powermiao8k.rules \
    "${pkgdir}/etc/udev/rules.d/99-powermiao8k.rules"

}
