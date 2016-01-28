# Maintainer: Chris Simpson <csimpson.archlinux at gmail dot com>

pkgname=glues-git
_gitname=glues
pkgver=7.44cb7c6
pkgrel=1
pkgdesc='GLU ES port based on original GLU 1.3'
arch=('armv7h')
url='https://github.com/lunixbochs/glues'
license=('custom')
depends=('mesa')
makedepends=('git' 'cmake')

source=("git+https://github.com/lunixbochs/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  cmake .
  make GLU
}

package() {
  cd "${_gitname}"
  install -d "${pkgdir}"/usr/lib/${_gitname}
  cp libGLU.so.1 "${pkgdir}"/usr/lib/${_gitname}/
  ln -sr "${pkgdir}"/usr/lib/${_gitname}/libGLU.so.1 "${pkgdir}"/usr/lib/${_gitname}/libGLU.so
  install -d "${pkgdir}"/etc/ld.so.conf.d
  echo "/usr/lib/${_gitname}" > "${pkgdir}"/etc/ld.so.conf.d/${_gitname}.conf
  install -d "${pkgdir}"/usr/share/licenses/${pkgname}
  cp -v LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/
}
