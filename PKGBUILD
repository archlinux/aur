# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Stuart Mumford <stuart at cadair dot com>
# Contributor: Maximilian Berger <snowdragon92 at gmail dot com>
pkgname=paraview-bin
_pkgname=paraview
_PkgName=ParaView
_pkgver=5.2.0
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="ParaView is an open-source, multi-platform data analysis and visualization application"
arch=('x86_64')
url="http://www.paraview.org/"
license=('custom')
source=("http://www.paraview.org/files/v${pkgver:0:3}/${_PkgName}-${_pkgver}-Qt4-OpenGL2-MPI-Linux-64bit.tar.gz"
        "https://gitlab.kitware.com/paraview/paraview/raw/v${_pkgver}/License_v1.2.txt"
        "paraview.sh")
sha256sums=('a4af79007db15bc4ffa281fd2b86c5198f0973aff8a8384b54782146641561cc'
            'd2b1ab821f9b09f99c2b8ddb50438e1a0a7bae18bbb00e6a8962fb57ec64a197'
            'df0f6f274a69a4111709dbedb7fa968e01608b31c187421c121a117cdb854942')
conflicts=('paraview')
provides=('paraview')

package() {
  # Install everything
  mkdir -p "${pkgdir}/opt/${_pkgname}"
  cp -r "${srcdir}/${_PkgName}-${_pkgver}-Qt4-OpenGL2-MPI-Linux-64bit"/* \
  "${pkgdir}/opt/${_pkgname}"

  # Install license
  install -Dm644 "License_v1.2.txt" \
    "${pkgdir}/opt/${_pkgname}/share/licenses/${pkgname}/LICENSE"

  # Install script to set path
  install -Dm755 "${srcdir}/paraview.sh" \
    "${pkgdir}/etc/profile.d/paraview.sh"
}
