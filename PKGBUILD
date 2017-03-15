# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Stuart Mumford <stuart at cadair dot com>
# Contributor: Maximilian Berger <snowdragon92 at gmail dot com>
pkgname=paraview-bin
_pkgname=paraview
_PkgName=ParaView
_pkgver=5.3.0
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="ParaView is an open-source, multi-platform data analysis and visualization application"
arch=('x86_64')
url="http://www.paraview.org/"
license=('custom')
_flavour=Qt5-OpenGL2-MPI-Linux-64bit
source=("http://www.paraview.org/files/v${pkgver:0:3}/${_PkgName}-${_pkgver}-${_flavour}.tar.gz"
        "https://gitlab.kitware.com/paraview/paraview/raw/v${_pkgver}/License_v1.2.txt"
        "paraview.sh")
sha256sums=('ee05d4443f20494b70979ce06f83667be45ffe2dff154c34dc4280d13b83a54f'
            'd2b1ab821f9b09f99c2b8ddb50438e1a0a7bae18bbb00e6a8962fb57ec64a197'
            'df0f6f274a69a4111709dbedb7fa968e01608b31c187421c121a117cdb854942')
conflicts=('paraview')
provides=('paraview')

package() {
  # Install everything
  mkdir -p "${pkgdir}/opt/${_pkgname}"
  cp -r "${srcdir}/${_PkgName}-${_pkgver}-${_flavour}"/* \
  "${pkgdir}/opt/${_pkgname}"

  # Install license
  install -Dm644 "License_v1.2.txt" \
    "${pkgdir}/opt/${_pkgname}/share/licenses/${pkgname}/LICENSE"

  # Install script to set path
  install -Dm755 "${srcdir}/paraview.sh" \
    "${pkgdir}/etc/profile.d/paraview.sh"

  # Symlink for desktop entries
  mkdir -p "${pkgdir}/usr/share/applications"
  ln -sf "${pkgdir}/opt/${_pkgname}/share/applications/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/"
}
