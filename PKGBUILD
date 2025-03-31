# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="ADMeshGUI"
pkgname="${_Name,,}"
_commit_rel="7b2bab5a4c53a5313139103361a850022f753b78" # 1.0.1
_commit="13f9e81937971424368cf6a2c6cd18c3be0d77b3" # r2
pkgver="1.0.1+r2+g${_commit::7}"
pkgrel=1
pkgdesc="STL viewer and manipulation tool"
arch=('x86_64')
url="https://github.com/admesh/${_Name}"
license=('AGPL-3.0-only')
depends=('admesh' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libgl' 'qt5-base' 'stlsplit')
_pkgsrc="${_Name}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
b2sums=('5921c3d1c3e2d458fd32fb5c235a72e45bedb0412cafe78420c100bf54941603038576709a4dedafdeeea6050b0fb4ad48b02edcaaab5142783ab286f7602d8a')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build"
}

build() {
  cd "${srcdir}/${_pkgsrc}/build"
  qmake-qt5 ..
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "build"
  make INSTALL_ROOT="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
