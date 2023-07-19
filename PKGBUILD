# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=thunderbolt-utils
# pkgver does not allow dashes
actualver="0.1-rc1"
pkgver="${actualver//-/.}"
pkgrel=1
pkgdesc="Thunderbolt/USB4 Linux user-space utilities from Intel"
url="https://github.com/intel/thunderbolt-utils"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('gcc')
source=(
    "${url}/archive/refs/tags/v${actualver}.tar.gz"
)

build() {
    cd $srcdir/$pkgname-$actualver/lib/
    # Patch Makefile output
    sed -i 's/LIBTBT_EXEC = \/usr\/bin\/lstbt/LIBTBT_EXEC = \.\/lstbt/' Makefile
    make
}

package() {
    install -Dm755 $srcdir/$pkgname-$actualver/lib/lstbt "${pkgdir}/usr/bin/lstbt"
    install -Dm644 $srcdir/$pkgname-$actualver/LICENSES/GPL-2.0 "${pkgdir}/usr/share/licenses/${pkgname}/GPL-2.0"
    install -Dm644 $srcdir/$pkgname-$actualver/LICENSES/LGPL-2.0 "${pkgdir}/usr/share/licenses/${pkgname}/LGPL-2.0"
}

sha256sums=('d036a1f1b42b6f32f88124bceceac0361bf67258304274840dd60c319fc60b84')
