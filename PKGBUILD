# Contributor: Kazuo Teramoto <kaz.rag gmail com>
# Contributor: scj <scj archlinux us>
# Contributor: tracer <jcdenton513 gmail com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=orpie
pkgver=1.6.0
pkgrel=1
epoch=
pkgdesc="Curses-based RPN calculator"
arch=('i686' 'x86_64')
url="https://github.com/pelzlpj/orpie"
license=('GPL3')
groups=()
depends=('ncurses' 'gsl')
makedepends=('ocaml' 'ocaml-gsl' 'camlp5' 'dune' 'ocaml-curses' 'ocaml-num')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=("!emptydirs")
install=
changelog=
source=("https://github.com/pelzlpj/orpie/archive/release-${pkgver}.tar.gz"
        "install-prefix.patch")
noextract=()
sha256sums=('bd0f38847a28d465a9149055e7da78cca82ec25dd91d55e51503c1b0a462c718'
            '27607076408ad164f91a142eebbefa845eecec6ff9b0783b336deaaed0ed9d12')

prepare() {
  cd "$srcdir/${pkgname}-release-${pkgver}"
  patch -uNp1 -i ../install-prefix.patch || return 1
}

build() {
  cd "$srcdir/${pkgname}-release-${pkgver}"
  make
}

package() {
  cd "$srcdir/${pkgname}-release-${pkgver}"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mkdir -p "${pkgdir}/etc" "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/etc/orpie/orpierc" "${pkgdir}/etc"
  mv "${pkgdir}/usr/man" "${pkgdir}/usr/share"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share"
}

