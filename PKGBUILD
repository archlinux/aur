# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname=mangl
pkgver=1.1.4
pkgrel=2
pkgdesc="graphical man page viewer"
arch=('x86_64')
url="https://github.com/zigalenarcic/mangl"
license=('BSD 2-Clause')
depends=('zlib' 'glfw' 'libgl' 'freetype2')
optdepends=('fontconfig: set custom font')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('376bd482b66878fff04de2f0c693514d4cf6fc437bc2ea26c540fca192bf5642')

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

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
