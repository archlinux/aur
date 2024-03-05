# Maintainer: Kookies <kookies at tutamail dot com>

pkgname=libctru-git
_libname=libctru
pkgver=v2.3.0.4.ga6a6548
pkgrel=1
epoch=1
pkgdesc="Nintendo 3DS userland library. (git)"
arch=('any')
url="https://github.com/devkitPro/libctru"
license=('LicenseRef-libctru')
depends=('devkitARM')
makedepends=('git' 'devkit-env' 'devkitARM')
provides=('libctru')
conflicts=('libctru')
source=('libctru::git+https://github.com/devkitPro/libctru')
md5sums=('SKIP')
options=(!strip staticlibs)

pkgver() {
  cd "${srcdir}/${_libname}"
  git describe --long --tags | sed 's/([^-]*-g)/r1/;s/-/./g'
}

build() {
  source /etc/profile.d/devkit-env.sh
  make -C "${srcdir}/${_libname}/${_libname}"
}

package() {
  cd "${srcdir}/${_libname}"

  export DESTDIR="${pkgdir}/"
  make -C "${_libname}" install

  # license
  install -d "${pkgdir}"/usr/share/licenses/${pkgname}
  sed '/license/,$!d' README.md > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
