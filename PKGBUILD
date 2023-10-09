# Maintainer: badcast <lmecomposer@gmail.com>
_pkgbase="epic-piano-instrument"
pkgname=${_pkgbase}
pkgver=1.0.0
pkgrel=0
url="https://github.com/badcast/${_pkgbase}"
pkgdesc="Epic Piano - The virtual instrument based on the RoninEngine framework that allows you to unleash your creative potential and craft music of epic proportions."
arch=(x86_64)
license=('GPLv3')
depends=('ronin-engine')
makedepends=('cmake' 'gcc' 'make' 'pkgconf')
source=("git+${url}.git")
md5sums=('SKIP')

build(){
   # Environment
   cd "${srcdir}/${_pkgbase}"
   build_dir="${srcdir}/build"

   # Configuring
   cmake -S . -B "${build_dir}" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr

   # Build
   cmake --build "${build_dir}"
}

package(){
   # Environment
   cd "${srcdir}/${_pkgbase}"
   build_dir="${srcdir}/build"

   DESTDIR="${pkgdir}" cmake --install "${build_dir}"

   install -Dm644 "${srcdir}/${_pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
}
