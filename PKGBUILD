# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="river-shifttags"
pkgver=0.2.2
pkgrel=1
pkgdesc="A small utility for the river Wayland compositor to rotate the focused tags"
arch=(
  'x86_64'
)
url="https://gitlab.com/akumar-xyz/${pkgname}"
license=(
  'GPL-3.0-only'
)
depends=(
  'glibc'
  # 'pixman'
  'river'
  'wayland'
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/-/archive/${pkgver}/${_pkgsrc}.tar.gz"
)
b2sums=('0ee53c1f0fbb7e5e1a96b15923294abafcbe827e9482440e071d8fdd4c4bf343ef3b00cf31e063bd35615f2a8eb6cd7bf7a5cf5582008c0c74eb676c9f5dbf45')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -e 's/$(shell pkg-config --cflags pixman-1)//g' \
      -e 's/$(shell pkg-config --libs pixman-1)//g' \
      -i 'Makefile'
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" PREFIX='/usr' install

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
