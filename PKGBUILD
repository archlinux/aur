# Maintainer: badcast <lmecomposer@gmail.com>
_pkgbase="epic-piano-instrument"
pkgname=${_pkgbase}
pkgver=1.0.0
pkgrel=1
url="https://github.com/badcast/${_pkgbase}"
pkgdesc="Epic Piano - The virtual instrument based on the RoninEngine framework that allows you to unleash your creative potential and craft music of epic proportions."
arch=(x86_64)
license=('GPLv3')
depends=('ronin-engine')
makedepends=('cmake' 'gcc' 'make' 'pkgconf')
source=("git+${url}.git"
        "${_pkgbase}.desktop"
        "${_pkgbase}-icon.png")
sha256sums=('SKIP'
         '3cceec90fcaebcea5400d3ca588bac8a170e64cd35b51960d0f369a47f4b48a5'
         '8434f3dfe581ff89f222b6eb6c8bc3f847c4e20bc2153ea6778d550899c15be4')

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

   chmod 755 "${pkgdir}/usr/bin/${_pkgbase}"
   install -Dm644 "${srcdir}/${_pkgbase}.desktop" -t "${pkgdir}/usr/share/applications"
   install -Dm644 "${srcdir}/${_pkgbase}-icon.png" -t "${pkgdir}/usr/share/icons"
   install -Dm644 "${srcdir}/${_pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
}
