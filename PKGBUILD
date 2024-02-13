# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname=mangl
pkgver=1.1.3
pkgrel=1
pkgdesc="graphical man page viewer"
arch=('x86_64')
url="https://github.com/zigalenarcic/mangl"
license=('BSD 2-Clause')
depends=('zlib' 'glfw' 'libgl' 'freetype2')
optdepends=('fontconfig: set custom font')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('bd1c41f10b1c5914564d5825e912e2696f787c4b44c7ed55b023b80156a6726e'
            '370e454df24a2bf0bf185988d92083c0ec5bd72548a5fba9c44867e76a1d8d91')

prepare() {
  cd "${pkgname}-${pkgver}"

  echo "PREFIX=\"/usr\"" >> mandoc/configure.local
  echo "MANDIR=\"\${PREFIX}/share/man\"" >> mandoc/configure.local
}

build() {
  cd "${pkgname}-${pkgver}"

  ./configure && make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
