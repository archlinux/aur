# Maintainer: Jens Adam <jra@byte.cx>

pkgname=ekgping
pkgver=1.31
pkgrel=3
pkgdesc='Electrocardiograph-like graphical and audible ping'
url='http://finalrewind.org/projects/ekgping/'
license=('custom:WTFPL')
arch=('any')
depends=('perl-file-sharedir' 'perl-ipc-run' 'perl-sdl' 'perl-term-size')
makedepends=('perl-module-build' 'perl-test-compile' 'perl-test-pod')
options=('!emptydirs')
validpgpkeys=('781BB7071C6BF648EAEB08A1100D5BFB5166E005')
source=("http://finalrewind.org/projects/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.asc})
md5sums=('0e215c7cbdbef81a5e6d1cfca87bd85c' '7f25046292e283d6c2ee55e2386a0c44')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  perl Build.PL installdirs=vendor destdir="${pkgdir}"
  ./Build
}

check() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  ./Build test
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  ./Build install
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
