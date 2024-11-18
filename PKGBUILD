# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
# Contributor  : George Eleftheriou <eleftg>
# Contributor : Martin Wimpress <code@flexion.org>
# Contributor : Nick Pope
# Contributor : Bryce Nordgren <bnordgren at gmail dot com>
pkgname=hdfview-bin
_pkgname=HDFView
pkgver=3.3.2
pkgrel=2
pkgdesc="a GUI browser for reading hdf5 files - prebuilt binaries from the HDF group"
arch=('x86_64')
url="https://github.com/HDFGroup/hdfview/"
license=('custom')
provides=('hdfview')
replaces=('hdfview-beta')
conflicts=('hdfview-beta' 'hdfview')
source=("https://github.com/HDFGroup/hdfview/releases/download/v${pkgver}/${_pkgname}-${pkgver}-Linux-x86_64.tar.gz")
sha512sums=('444101f4cb77a1b94477852dab52163c08fc3f6be23cbfd46efdf0f2572a5df3067b9db91b4afdd90d95eb42526c6491d23d9c1859a088c17132834965ba2924')

package() {

  bsdtar -xf "${srcdir}/hdfview_${pkgver}_amd64.deb" -C "${srcdir}"
  bsdtar -xf "${srcdir}/data.tar.zst" -C ${pkgdir}

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/hdfview/bin/HDFView" "${pkgdir}/usr/bin/hdfview"

  mkdir -p "${pkgdir}/usr/share/applications"
  ln -s "/opt/hdfview/lib/hdfview-HDFView.desktop" "${pkgdir}/usr/share/applications/"
  
  mkdir -p "${pkgdir}/usr/share/mime/application"
  ln -s "/opt/hdfview/lib/hdfview-HDFView-MimeInfo.xml" "${pkgdir}/usr/share/mime/application/"

  install -D -m 644 "${srcdir}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
