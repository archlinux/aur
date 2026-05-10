# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Nathan Owe <ndowens04+AUR @ gmail.com>

pkgname="itex2mml"
pkgver=1.6.2
pkgrel=1
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
sha256sums=('8af5a7443df87f74e0cdf2bce27dd78396566cbcffaf15efe1e87325fa6b15d3')

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
