pkgname=libctru-git
_gitname=ctrulib
_libname=libctru
pkgver=v1.4.0.5.g6f64dee3
pkgrel=1
epoch=1
pkgdesc="Library for Nintendo 3DS homebrew development"
arch=('any')
url="https://github.com/smealum/ctrulib"
license=('custom: zlib')
depends=('devkitARM')
makedepends=('git')
provides=('libctru')
conflicts=('libctru')
source=('ctrulib::git://github.com/smealum/ctrulib')
md5sums=('SKIP')
options=(!strip staticlibs)

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --always | sed 's|-|.|g'
}

build() {
  source /etc/profile.d/devkit-env.sh
  make -C "${srcdir}/${_gitname}/${_libname}"
}

package() {
  cd "${srcdir}/${_gitname}"

  export DEVKITPRO="${pkgdir}/opt/devkitpro"
  make -C "${_libname}" install

  # license
  install -d "${pkgdir}"/usr/share/licenses/${_libname}
  sed '/license/,$!d' README.md > "${pkgdir}/usr/share/licenses/${_libname}/LICENSE"
}
