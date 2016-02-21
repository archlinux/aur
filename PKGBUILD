# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=wjelement-git
_pkgname=wjelement
pkgver=r191.4691cf1
pkgrel=1
pkgdesc="JSON manipulation in C including reading, writing and validation"
arch=('i686' 'x86_64')
url="https://github.com/netmail-open/wjelement/wiki"
license=('LGPL')
conflicts=('wjelement')
provides=('wjelement')
depends=('bash' 'rlwrap')
makedepends=('git' 'cmake')
source=(${_pkgname}::git+https://github.com/netmail-open/${_pkgname}.git)
md5sums=(SKIP)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
	
  make DESTDIR="${pkgdir}" install

  install -dm 755 "${pkgdir}/usr/share"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/doc"
}
