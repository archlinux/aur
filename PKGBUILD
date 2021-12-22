# Maintainer: Mateo <kookies@tutamail.com>

pkgname=libctru-git
_libname=libctru
pkgver=v2.0.1.11.g5f13628
pkgrel=1
epoch=1
pkgdesc="Library for Nintendo 3DS homebrew development"
arch=('any')
url="https://github.com/devkitPro/libctru"
license=('ZLIB')
depends=('devkitARM')
makedepends=('git')
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

  export DEVKITPRO="${pkgdir}/opt/devkitpro"
  make -C "${_libname}" install

  # license
  install -d "${pkgdir}"/usr/share/licenses/${_libname}
  sed '/license/,$!d' README.md > "${pkgdir}/usr/share/licenses/${_libname}/LICENSE"
}
