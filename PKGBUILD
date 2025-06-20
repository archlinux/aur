# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Maintainer: tee < teeaur at duck dot com >

_pkgname="ipfs-desktop"
pkgname="${_pkgname}-bin"
pkgver=0.43.0
pkgrel=1
pkgdesc="Desktop client for the InterPlanetary File System"
arch=('x86_64')
url="https://docs.ipfs.tech/install/ipfs-desktop/"
_url="https://github.com/ipfs/${_pkgname}"
license=('MIT')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2'
         'glibc' 'gtk3' 'hicolor-icon-theme' 'libcups' 'libx11' 'libxcb'
         'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon'
         'libxrandr' 'mesa' 'nspr' 'nss' 'pango' 'sh' 'systemd-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-x86_64.deb")
source=("${_pkgsrc}-CHANGELOG.md::${_url}/raw/refs/tags/v${pkgver}/CHANGELOG.md"
        "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE")
 source_x86_64=("${_pkgsrc}-x86_64.tar.xz::${_url}/releases/download/v${pkgver}/${_pkgsrc}-linux-x64.tar.xz")
#source_x86_64=("${_pkgsrc}-x86_64.deb::${_url}/releases/download/v${pkgver}/${_pkgsrc}-linux-amd64.deb")
b2sums=('a838c58e367ef1b71eb09ad5aff90be608508dd30f49894b15eb56e254aa69197114ba2596565dce84d3b0dcdca776d3557329f4dc3823308168d3a288467773'
        'bf181dc848d42f39e73a0c00a20e15f5d2c9a96ecad044a7098c1ecb49feb1875491d1375f9b200f01cea192d5155fe172190d7dc816c521f94d5697fffb24da'
        '2c3fb2af6c8e92bcacb15b3878b1125fd4f8b4d48e37b2b3ce818517b7a7a94f68ef3c155e8d8cb5b2d39727fe916e293b892c48ee59167b4ee564bbedc70d9d')
b2sums_x86_64=('76e7e4648458597463776ce04e36aa5ecadae47c848edfd93e0beea0da1032bf3a6b434380069b2b907fad4356bec6cfb75e5538ac254a2fbbb47c4646e38c30')

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

#  cd "applications"
  cd "$srcdir"
#  sed -i "s|opt/IPFS Desktop|opt/${_pkgname}|g" "${_pkgname}.desktop"
}

package() {
  cd "${srcdir}"
  install -vdm755 "${pkgdir}/opt/${_pkgname}"
  cp -vr "${_pkgsrc}-linux-x64"/* "${pkgdir}/opt/${_pkgname}/"
#  cp -vr --no-preserve=ownership "${_pkgsrc}-linux-x64"/* "${pkgdir}"

  install -vDm644 "${_pkgsrc}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  install -vdm755 "${pkgdir}/usr/bin"
  ln -vsf "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
