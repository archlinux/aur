# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="simarrange"
_commit_rel="d52382feb716621f9ac08d25a502420fc1d3c983" # 20131022
_commit="8238ce568c3ce23e1ad5fbfec55031907bd23f77" # r12
pkgver="20131022+r12+g${_commit::7}"
pkgrel=1
pkgdesc="STL 2D plate packer with collision simulation"
arch=('x86_64')
url="https://github.com/kliment/${pkgname}"
license=('AGPL-3.0-or-later')
depends=('admesh' 'argtable' 'gcc-libs' 'glibc' 'opencv2')
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
b2sums=('104640c75b54aadb722ac5e61a9b2caec37685f01212220164c4fd58ff722858c8bdd72019217900315f73698324efa58141dc2821326f4275959a7e2f1f849d')

build() {
  cd "${srcdir}/${_pkgsrc}"
  make \
    CFLAGS="${CFLAGS} -I . -fno-builtin-strlen $(pkg-config opencv --cflags) -DPARALLEL" \
    LDFLAGS="-lm -L/opt/opencv2/lib -lopencv_core -lopencv_highgui -lopencv_imgproc -largtable2 -ladmesh -fopenmp ${LDFLAGS}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/share/man/man1"
  make prefix="${pkgdir}/usr" install

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=2 sw=2 et:
