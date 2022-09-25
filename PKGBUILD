# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=mangl
pkgver=1.1.2
pkgrel=1
pkgdesc="graphical man page viewer"
arch=('x86_64')
url="https://github.com/zigalenarcic/mangl"
license=('BSD 2-Clause')
depends=('zlib' 'glfw' 'libgl' 'freetype2')
optdepends=('fontconfig: set custom font')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('a8f69f30d2dbddaffb9c766669739ad0c838d67e95d7806f7cee332bb304dc7b'
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
