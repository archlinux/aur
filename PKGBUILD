# Contributor: Kazuo Teramoto <kaz.rag gmail com>
# Contributor: scj <scj archlinux us>
# Contributor: tracer <jcdenton513 gmail com>
# Maintainer: aksr <aksr at t-com dot me>
# Maintainer: AI5C <ai5c@ai5c.com>
pkgname=orpie
pkgver=1.6.1
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
sha256sums=('1ae5a99fbbf492869664e4bd81e6bf5cf65bdaf5027908c1e9313843bb5d5749'
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

