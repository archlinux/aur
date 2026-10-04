# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

pkgname=tree-sitter-fish
pkgver=3.7.0
pkgrel=1
pkgdesc="Fish shell grammar for tree-sitter"
arch=('x86_64')
url='https://github.com/ram02z/tree-sitter-fish'
license=('Unlicense')
groups=('tree-sitter-grammars')
depends=('glibc')
optdepends=('tree-sitter: core library')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}-makefile.patch")
sha256sums=('00234274eebcd0815bb3679b0ac82d96c69a61a9e4d7db9dd2ab34fc89010871'
            '52f7583c07c8d4134cecd619974b876a057fa05f7130f20a59af2fb0fa4d29d1')
prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -s -i "${srcdir}/${pkgname}-makefile.patch"
}

build() {
  make -C "${srcdir}/${pkgname}-${pkgver}/src"
}

package() {
  make -C "${srcdir}/${pkgname}-${pkgver}/src" install DESTDIR="${pkgdir}"

  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dvm644 queries/highlights.scm \
    "${pkgdir}/usr/share/tree-sitter/queries/fish/highlights.scm"

  install -Dvm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm0644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
