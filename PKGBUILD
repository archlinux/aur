# Maintainer: Valère Monseur <valere dot monseur@ymail dot com>

pkgname=awf-git
_pkgname=awf
pkgver=v1.3.0.r0.g191e428
pkgrel=1
pkgdesc="A theme preview application for gtk2 and gtk3"
arch=(i686 x86_64)
url="https://github.com/valr/awf"
license=("GPL")
depends=("gtk2" "gtk3" "hicolor-icon-theme")
makedepends=("git")
source=("$pkgname"::'git+https://github.com/valr/awf.git')
md5sums=("SKIP")
install=awf.install

pkgver() {
  cd "${srcdir}/${pkgname}"

  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}
