# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Bastien "neitsab" Traverse <firstname [at] lastname [dot] email>
# Contributor: Icaro Perseo <icaroperseo[at]protonmail[dot]com>
# Contributor: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>

pkgname=ghostwriter
pkgver=1.8.1
pkgrel=2
pkgdesc="A cross-platform, aesthetic, distraction-free Markdown editor"
arch=('i686' 'x86_64')
url="https://github.com/wereturtle/ghostwriter"
license=('GPL3')
depends=('qt5-svg' 'qt5-webengine' 'hunspell')
makedepends=('qt5-tools')
optdepends=('multimarkdown: For alternative converter, superset of Markdown with various output formats'
            'pandoc: For Pandoc supported Markdown flavors and export to various formats'
            'cmark: For processing and rendering CommonMark')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wereturtle/ghostwriter/archive/v${pkgver}.tar.gz"
        "qt-5.15.patch")
sha512sums=('9f60f81a594cf161edfeac8c75830e186ab4ec2c22859b2bad40768e1ecf64e6842b52a69024a1f014d24a2f1cbb38e15a7799101d7fd54ef7709e245f6ac521'
            '3f62e61560624131088c68ed3b55e68b29c2e747a7db8f7b9b9680df3db780bf9639ff8b630a085a9eace0cbf2322a6b458bd739d872453a6193767bebd1340c')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Backport of https://github.com/wereturtle/ghostwriter/pull/519
  patch -Np1 < "${srcdir}/qt-5.15.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  qmake PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install INSTALL_ROOT="${pkgdir}"

  install -Dm644 "CREDITS.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/CREDITS.md"
  install -Dm644 "README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "resources/COPYING" \
    "${pkgdir}/usr/share/doc/${pkgname}/COPYING"
}
