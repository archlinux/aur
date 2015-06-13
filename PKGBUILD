# Maintainer: Philipp Claßen <philipp.classen@gmx.net>
pkgname=livius-git
pkgver=r16.d5c10b5
pkgrel=1
pkgdesc="A Qt-based TLCV-compatible live chess viewer"
arch=('i686' 'x86_64')
url="https://github.com/kmar/livius"

# source is under zlib
# piece sets are under creative commons public domain
license=('zlib')

depends=('qt5-svg' 'qt5-webkit')
makedepends=('gcc' 'qtchooser' 'make')
source=('git://github.com/kmar/livius.git')
md5sums=('SKIP')

pkgver() {
  cd livius
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/livius"
  make
}

package() {
  cd "${srcdir}/livius"
  mkdir -p "${pkgdir}/usr/share/livius"
  cp -R build/* "${pkgdir}/usr/share/livius"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  mkdir -p "${pkgdir}/usr/bin"
  printf "#!/bin/sh\n/usr/share/livius/livius \"\$@\"" >> "${pkgdir}/usr/bin/livius"
  chmod 755 "${pkgdir}/usr/bin/livius"
}
