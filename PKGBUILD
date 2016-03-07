# Maintainer: zfo <zfoofz1@gmail.com>
pkgname=dbuildstat-git
_pkgname=dbuildstat
pkgver=r9.6ab0467
pkgrel=1
pkgdesc="Measure and visualize per-module build times of D projects"
arch=('any')
url="https://github.com/CyberShadow/DBuildStat"
license=('Boost')
groups=()
depends=('libphobos')
makedepends=('git' 'dtools')
provides=()
conflicts=('dbuildstat')
replaces=()
backup=()
options=()
install=
source=("${_pkgname}::git+${url}")
noextract=()
md5sums=('SKIP') #generate with 'makepkg -g'

prepare(){
  cd "${srcdir}/${_pkgname}"
  git submodule init
  git submodule update
}

build() {
 cd "${srcdir}/${_pkgname}"
  # BUILD
  rdmd --build-only dbuildstat.d
  rdmd --build-only makedot.d
  rdmd --build-only makesvg.d
  rdmd --build-only printtimes.d
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
	#DESTDIR="$pkgdir/" make install
	exec_dir=${pkgdir}/usr/bin/
  mkdir -p ${exec_dir}
  cp dbuildstat ${exec_dir}
  cp makedot ${exec_dir}/dbuildstatmd
  cp makesvg ${exec_dir}/dbuildstatms
  cp printtimes ${exec_dir}/dbuildstatpt
}

# vim:set ts=2 sw=2 et:
