# Maintainer: zer0def <zer0def@freenode/github>
pkgname=uts-server-git
pkgver=r305.86d9094
pkgrel=1
pkgdesc="Micro RFC 3161 Time-Stamp server written in C."
arch=('i686' 'x86_64')
url="https://github.com/kakwa/uts-server"
license=('MIT')
depends=('openssl')
makedepends=('cmake' 'git' 'linux-headers')
provides=('uts-server')
conflicts=('uts-server')
source=(
  "$pkgname::git+https://github.com/kakwa/uts-server"
  "0001-globals-fix.patch"
)
sha512sums=(
  'SKIP'
  '42a448bab97eed4a8ca18d4d881c04c163e9039f89cc4ddb420b4a63d4e9138aff3cb97f0ec8de3031a12ef4272574fa8fdc8661f15c0583cbb2fedc3f4dfd4f'
)
b2sums=(
  'SKIP'
  'ae839396e1a21b272a63688920eae0d82a1dccf3bed780888d820d3d26f6d38d909bb98bc1b0065db251be368b890cb57b8445ec44ce287320fbf9e1970e0316'
)

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -p1 <"${srcdir}/0001.patch"
}

build() {
  cd "${srcdir}/${pkgname}"
  cmake -DBUNDLE_CIVETWEB=ON
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
