# Maintainer: Konstantin Shalygin <k0ste@cn.ru>

pkgname='phantom'
pkgver=r17.46aa170
pkgrel=1
pkgdesc='Scalable I/O engine'
arch=('i686' 'x86_64')
url="https://github.com/k0ste/${pkgname}"
license=('LGPL2.1')
depends=('openssl')
makedepends=('git' 'gcc-multilib')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
  cd "${srcdir}/${pkgname}"
  make -R all
}

package(){
  pushd "${srcdir}/${pkgname}"
  install -d "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${pkgname}"
  install -Dm775 "bin/${pkgname}" "${pkgdir}/usr/bin"
  install -Dm644 "lib/${pkgname}/"*.so "${pkgdir}/usr/lib/${pkgname}"
  popd
}
