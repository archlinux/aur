# Maintainer : Popolon < Popolon @L popolon .org>

_pkgname=luajit-gl
pkgname=${_pkgname}-git
pkgver=r6.d328638
pkgrel=1
pkgdesc='LuaJIT binding to OpenGL'
arch=('any')
url="https://github.com/Playermet/luajit-gl"
license=('MIT')
depends=('luajit' 'mesa' 'luajit-glfw')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('git')
sha512sums=('SKIP')
source=("${pkgname}::git+${url}.git")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  luajitver=`luajit -v | awk '{print $2}'| cut -d . -f 1,2` 
  cd "${srcdir}/${pkgname}"
  mkdir -p ${pkgdir}/usr/share/luajit-${luajitver}
  install -Dm644 gl.lua ${pkgdir}/usr/share/luajit-${luajitver}/
}
