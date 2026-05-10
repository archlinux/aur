# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="itex2mml"
pkgname="ruby-${_name}"
pkgver=1.6.2
pkgrel=1
pkgdesc="iTeX to MathML converter (Ruby bindings)"
arch=(
  'x86_64'
)
url="https://golem.ph.utexas.edu/~distler/blog/itex2MML.html"
license=(
  'GPL-2.0-or-later OR LGPL-2.0-or-later OR MPL-1.1'
)
depends=(
  'glibc'
  'ruby'
)
makedepends=(
  'swig'
)
checkdepends=(
  'ruby-test-unit'
)
_pkgsrc="itexToMML"
source=(
  "https://golem.ph.utexas.edu/~distler/blog/files/itexToMML-${pkgver}.tar.gz"
  "${_name}_fix_makefile.patch"
)
sha256sums=('8af5a7443df87f74e0cdf2bce27dd78396566cbcffaf15efe1e87325fa6b15d3'
            'ac6836a6135a0c0d5b5e4ee4f6372b776f6e6456edee4a39f65b9cdc75cd6b28')

prepare() {
  cd "${srcdir}/${_pkgsrc}/itex-src"
  patch -Np1 -i "${srcdir}/${_name}_fix_makefile.patch"
}

build() {
  cd "${srcdir}/${_pkgsrc}/itex-src"
  make ruby
}

check() {
  cd "${srcdir}/${_pkgsrc}/itex-src"
  make test_ruby
}

package() {
  cd "${srcdir}/${_pkgsrc}/itex-src"
  make PREFIX='/usr' DESTDIR="${pkgdir}" install_ruby
}
