# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Nathan Owe <ndowens04+AUR @ gmail.com>

pkgname="itex2mml"
pkgver=1.6.1
pkgrel=2
pkgdesc="iTeX to MathML converter"
arch=(
  'x86_64'
)
url="https://golem.ph.utexas.edu/~distler/blog/itex2MML.html"
license=(
  'GPL-2.0-or-later OR LGPL-2.0-or-later OR MPL-1.1'
)
depends=(
  'glibc'
  'libgcc'
  'libstdc++'
)
_pkgsrc="itexToMML"
source=(
  "https://golem.ph.utexas.edu/~distler/blog/files/itexToMML-${pkgver}.tar.gz"
)
sha256sums=('3ef2572aa3421cf4d12321905c9c3f6b68911c3c9283483b7a554007010be55f')

prepare() {
  cd "${srcdir}/${_pkgsrc}/itex-src"
  sed -e "s|/usr/local/bin|${pkgdir}/usr/bin|g" \
      -e "s/\$(CXX) \$(CFLAGS)/ \$(CXX) ${CFLAGS} ${LDFLAGS}/g" \
      -i 'Makefile'
}

build() {
  cd "${srcdir}/${_pkgsrc}/itex-src"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README" -t "${pkgdir}/usr/share/doc/${pkgname}"

  cd "itex-src"
  install -d "${pkgdir}/usr/bin"
  make DESTDIR="${pkgdir}" install
}
