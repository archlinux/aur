# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
pkgname=blueprint-compiler-docs-git
pkgdesc='A markup language for GTK user interfaces (documentation)'
url=https://gitlab.gnome.org/jwestman/blueprint-compiler.git
pkgver=0.6.0+23+g1df46b5
pkgrel=1
arch=(any)
license=()
provides=(blueprint-compiler-docs)
conflicts=(blueprint-compiler-docs)
makedepends=(git python-sphinx)
source=("${pkgname}"::"git+${url}")
sha256sums=(SKIP)

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags --long | sed -e "s/^v//" -e "s/-/+/g"
}

build() {
  arch-meson "${srcdir}/${pkgname}" build -D docs=true
  meson compile docs -C build
}

package() {
  mkdir -p "${pkgdir}"/usr/share/doc/blueprint-compiler
  cp -rT build/docs/en "${pkgdir}"/usr/share/doc/blueprint-compiler
}
