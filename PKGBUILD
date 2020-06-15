# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=nyble
pkgver=0.5.0
pkgrel=2
pkgdesc='A snake game for the terminal'
arch=('x86_64')
url='https://octobanana.com/software/nyble'
license=('MIT')
makedepends=('boost' 'cmake')
source=("https://github.com/octobanana/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('c05b842fa7cae9def06e6916690e12be249ad584d195c3fdc1f56d44bb87a47e')

build() {
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  make -C build
}

package() {
  make DESTDIR="${pkgdir}" PREFIX="/usr" -C build install
  install -Dm644 "${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${pkgname}-${pkgver}/doc/help.txt" "${pkgdir}/usr/share/doc/${pkgname}/help.txt"
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et: