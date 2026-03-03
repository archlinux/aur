# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Maintainer: tee < teeaur at duck dot com >

_pkgname="ipfs-desktop"
pkgname="${_pkgname}-bin"
pkgver=0.48.0
pkgrel=1
pkgdesc="Desktop client for the InterPlanetary File System"
arch=('x86_64')
url="https://docs.ipfs.tech/install/ipfs-desktop"
_url="https://github.com/ipfs/${_pkgname}"
license=('MIT')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2'
         'glibc' 'gtk3' 'hicolor-icon-theme' 'libcups' 'libx11' 'libxcb'
         'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon'
         'libxrandr' 'mesa' 'nspr' 'nss' 'pango' 'sh' 'systemd-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-CHANGELOG.md::${_url}/raw/v${pkgver}/CHANGELOG.md"
        "${_pkgsrc}-README.md::${_url}/raw/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.tar.xz::${_url}/releases/download/v${pkgver}/${_pkgsrc}-linux-x64.tar.xz")
b2sums=('302ff3f347fff77e6e1bb9acd16874bce5291eec4052ed654cd709bd5319a2f35022d228c7f1c1da4e4d752b8901730783a87464b70b724969807f911e68e617'
        '1a90b610fb2ed4ac8edffe1264971f04a4c7e647d6c19615589f22760828e02ea11f0ea7d6d0c88b0585d16643cfd60e36d39e196dfff04ea6fed75f0d71cf17'
        '2c3fb2af6c8e92bcacb15b3878b1125fd4f8b4d48e37b2b3ce818517b7a7a94f68ef3c155e8d8cb5b2d39727fe916e293b892c48ee59167b4ee564bbedc70d9d')
b2sums_x86_64=('ee54f11e6e4bc6a8828090b844ea0a8a9d2ed4dd46985d70deab5af7b152f8fe393716230f875c2843b6a5aed3fa963ed0c9540d4a4d4c934dfa92c5846f8448')

prepare() {
  cd "${srcdir}"
#  mkdir -p "${_pkgsrc}-${CARCH}"
#  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
#  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
#  rm -f data.tar.*
}

build() {
#  cd "${srcdir}/${_pkgsrc}-${CARCH}"
#  rm -rf "opt/${_pkgname}"
#  mv -f "opt/IPFS Desktop" "opt/${_pkgname}"

#  cd "usr/share"
#  rm -rf "doc"

  cd "${srcdir}"
#  sed -i "s|opt/IPFS Desktop|opt/${_pkgname}|g" "${_pkgname}.desktop"
}

package() {
  cd "${srcdir}"
  install -vdm755 "${pkgdir}/opt/${_pkgname}"
  cp -vr --no-preserve=ownership "${_pkgsrc}-linux-x64"/* "${pkgdir}/opt/${_pkgname}/"

  install -vDm644 "${_pkgsrc}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  install -vdm755 "${pkgdir}/usr/bin"
  ln -vsf "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
