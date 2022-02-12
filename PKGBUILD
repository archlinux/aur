# Maintainer; Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kpar2
pkgver=0.4.5
pkgrel=9
pkgdesc="PAR2 verification and repair program for KDE4"
arch=('x86_64')
url='http://code.google.com/p/kpar2kde4'
license=('GPL3')
depends=('kde-cli-tools'
         'kdelibs'
         'libpar2'
         )
makedepends=('cmake'
             'automoc4'
             )
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/kpar2kde4/kpar2-${pkgver}.tar.gz"
        'kpar2.desktop.diff'
        )
sha256sums=('91c4d12600e9d9346e37ac2bec98cf6331e9491d510aeda1e12b0c15e3f1324e'
            '48d28e11b739b111f7a3731be8e4973774f561e346104cb28f595eb530dfd31d'
            )

prepare() {
  patch -d "kpar2-${pkgver}" -p0 -i "${srcdir}/kpar2.desktop.diff"
}

build() {
  cmake -S "kpar2-${pkgver}" -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install

  # missing bits(?)
  install -Dm644 "kpar2-${pkgver}/src/kpar2ui.rc" "${pkgdir}/usr/share/apps/kpar2/kpar2ui.rc"
  install -Dm644 "kpar2-${pkgver}/src/config.kcfg" "${pkgdir}/usr/share/config.kcfg/kpar2.kcfg"
}
