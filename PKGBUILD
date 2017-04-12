# based on unigine-valley by ajs124 and meyithi

pkgname=unigine-superposition
_pkgname=Unigine_Superposition
pkgver=1.0
pkgrel=2
pkgdesc="Interactive Unigine Benchmark: walk through a lab of a lone professor"
arch=('x86_64')
url="http://www.unigine.com"
license=('custom:UNIGINE Engine')
depends=('libgl' 'gcc-libs' 'libxrandr' 'libxinerama' 'fontconfig' 'qt5-declarative' 'libxkbcommon-x11')
optdepends=('openal: sound support')
source=("https://assets.unigine.com/d/"${_pkgname}"-"${pkgver}".run")
sha512sums=('1aa51b04381bedb0d3519f1ef90dcc77607b04b124ea3577dcc38eb8e609e5e8c2d21de4b4b19ca5d92542856d152fcec88d19d5b86fca307aa8f7e84f5b28b1')
PKGEXT=.pkg.tar

build() {
  sh "${_pkgname}"-"${pkgver}".run --target "${pkgname}" --noexec
}

package() {
  cd "${srcdir}/${pkgname}"
  install -d "${pkgdir}/opt/${pkgname}"
  cp -R *  "${pkgdir}/opt/${pkgname}"/
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/bin/launcher" "${pkgdir}/usr/bin/unigine-superposition"
  install -Dm644 docs/Superposition_Benchmark_End-User_License_Agreement.pdf "${pkgdir}"/usr/share/licenses/${pkgname}/license
  install -Dm644 docs/Superposition_Benchmark_User_Manual.pdf "${pkgdir}"/usr/share/doc/${pkgname}/User_Manual.pdf
}
