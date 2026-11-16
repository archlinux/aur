# Maintainer: Mike Sampson <mike at sambodata dot com>
# Contributor: Lawrence Lee <valheru at facticius dot net>

_name=gle
pkgname="${_name}-te"
pkgver=3.1.0
pkgrel=2
pkgdesc="A library of C functions that draw extruded surfaces, including surfaces of revolution, sweeps, tubes, polycones, polycylinders and helicoids."
arch=('i686' 'x86_64')
url="http://www.linas.org/${_name}/index.html"
license=('GPL-2.0-only OR (LicenseRef-IBM-sample AND Artistic-1.0)')
depends=('libgl')
makedepends=('gcc' 'glut')
options=(!libtool)

source=(
  "http://downloads.sourceforge.net/${_name}/${_name}-${pkgver}.tar.gz"
  'fix-glu-callbacks.patch'
)
sha256sums=('dc8a74b5632b2c3fc84d33c2bf6ee43210b71b8ddf0a3166a25aeb46620bfa27'
            '5894d4dda6bf7adf2d0ddf75c8cbae79ff61ec97d437ad060266762a16815a49')

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"
  patch -Np1 -i "${srcdir}/fix-glu-callbacks.patch"
  ./configure --prefix=/usr --mandir=/usr/share
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  make -j1 DESTDIR="$pkgdir" install

  # Licenses
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 src/COPYING.src "$pkgdir/usr/share/licenses/$pkgname/LICENSE.ibm"
}

# vim:set ts=2 sw=2 et:
