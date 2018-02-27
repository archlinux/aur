# Maintainer: Frank Fishburn <frankthefishburn@gmail.com>

_pkgname=freesurfer
pkgname=$_pkgname-bin
pkgver=6.0.0
pkgrel=1
pkgdesc="An open source software suite for processing and analyzing (human) brain MRI images. (Precompiled binary version)"
arch=("i686" "x86_64")
url="https://surfer.nmr.mgh.harvard.edu/"
license=("custom")
depends=(libxss tcl tcsh libxpm pangox-compat libpng12 glu libxp gtk2 python)
optdepends=()
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("ftp://surfer.nmr.mgh.harvard.edu/pub/dist/${_pkgname}/${pkgver}/${_pkgname}-Linux-centos6_x86_64-stable-pub-v${pkgver}.tar.gz"
        "freesurfer.sh")
sha256sums=('9e68ee3fbdb80ab73d097b9c8e99f82bf4674397a1e59593f42bb78f1c1ad449'
            '30c269a50c825b4a5147337b111ea444389b11a8cefbcd9eb520d01af20984cd')

package() {
  install -d "${pkgdir}/opt" "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/etc/profile.d"
  cp -r --reflink=auto "${srcdir}/${_pkgname}" "${pkgdir}/opt/"
  mv "${pkgdir}/opt/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
  cp "${srcdir}/freesurfer.sh" "${pkgdir}/etc/profile.d/"
  find "${pkgdir}/opt/${_pkgname}/lib" -mindepth 2 -name \*.so\* -exec mv "{}" "${pkgdir}/opt/${_pkgname}/lib/" \;
  find "${pkgdir}/opt/${_pkgname}/lib" -name \*.a -delete
  find "${pkgdir}/opt/${_pkgname}/lib" -empty -delete
  ln -s /usr/lib/libjpeg.so "${pkgdir}/opt/${_pkgname}/lib/libjpeg.so.62"
  ln -s /usr/lib/libpng12.so.0 "${pkgdir}/opt/${_pkgname}/lib/"
  find "${pkgdir}" -empty -delete
}

# vim:set ts=2 sw=2 et:
