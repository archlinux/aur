# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=equalx
pkgver=0.7.1
pkgrel=2
pkgdesc="Makes you easily write equations in LaTeX and preview them in real-time"
url="http://equalx.sourceforge.net/"
depends=("qt4" "exempi" "texlive-bin" "poppler")
optdepends=("ghostscript: to export pdf and ps")
license=("GPL3")
source=("http://downloads.sourceforge.net/project/${pkgname}/EqualX-${pkgver%.*}/${pkgname}-${pkgver}.tar.gz")
arch=('i686' 'x86_64')
install=equalx.install
md5sums=('f7164b254f25fb265388b46e3fb8e464')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  qmake-qt4
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "equalx" "${pkgdir}/usr/bin/equalx"
  for _symbol in $(find resources/symbols -type f); do
    install -Dm644 "${_symbol}" "${pkgdir}/usr/share/equalx/${_symbol}"
  done
  install -Dm644 "resources/equalx.desktop" \
    "${pkgdir}/usr/share/applications/equalx.desktop"
  for _size in 16 22 24 32 48 64 128; do
    install -Dm644 "resources/icons/equalx/equalx-${_size}x${_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/equalx-icon.png"
  done
  install -Dm644 "resources/icons/equalx/equalx.svg" \
    "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/equalx.svg
  install -Dm644 "equalx.1" "${pkgdir}/usr/share/man/man1/equalx.1"
}
