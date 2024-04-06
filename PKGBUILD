# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname=xhidecursor
_commit=159b877
_pkgver=1.0.0
pkgver=1.0.0.r2.159b877
pkgrel=1
pkgdesc="minimal X-application which hides the cursor on key-press and unhides the cursor on mouse-movement"
arch=('i686' 'x86_64')
url="https://github.com/astier/xhidecursor"
license=('MIT')
depends=('libx11' 'libxfixes' 'libxi')
source=("${pkgname}-${_pkgver}::git+${url}#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}-${_pkgver}"

  printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}-${_pkgver}"

  make
}

package() {
  cd "${pkgname}-${_pkgver}"

  make DESTDIR="${pkgdir}" PREFIX="/usr/bin" install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
