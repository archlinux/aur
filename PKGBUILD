# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="cane"
_commit_rel="d019a531a8db1b57f9eb4b0c2e1e61f229617c99" # 2022075
_commit="a98bb65e21d128ae6da7c27ed4854ff5d27ed8d6" # r32
pkgver="2022075+r32+g${_commit::7}"
pkgrel=1
pkgdesc="Small MIDI sequencer DSL designed around vectors and euclidean rhythms"
arch=('x86_64')
url="https://github.com/Jackojc/${pkgname}"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'jack')
makedepends=('conflict-parser')
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz"
        "${pkgname}_release_build_flags.patch")
sha256sums=('867da8a5e693ebebf13e91d3d885019e5baae130aff425223a36a7975d44d141'
            '718c9742770c91f3eb062cb169e2a40729169cf27bed57aa2fb6f52ff1bf3bdc')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_release_build_flags.patch"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  make dbg=no
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  # make DESTDIR="${pkgdir}" PREFIX='/usr' install

  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
