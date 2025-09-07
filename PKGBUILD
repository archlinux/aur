# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Maintainer: tee < teeaur at duck dot com >

_pkgname="ipfs-desktop"
pkgname="${_pkgname}-bin"
pkgver=0.45.0
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
#noextract=("${_pkgsrc}-x86_64.deb")
source=("${_pkgsrc}-CHANGELOG.md::${_url}/raw/refs/tags/v${pkgver}/CHANGELOG.md"
        "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.tar.xz::${_url}/releases/download/v${pkgver}/${_pkgsrc}-linux-x64.tar.xz")
#source_x86_64=("${_pkgsrc}-x86_64.deb::${_url}/releases/download/v${pkgver}/${_pkgsrc}-linux-amd64.deb")
b2sums=('817b45d56848ee36c299f0d6a7ccf7d2539017eed0a0df71d829d50fb2f1a455ae5e7a8547608335a0a348e89b67b6dff5a78e8b0e46b772a47f59644cd66340'
        '9457488dac09a87a3ec13cbbfdd98f9858ad2e47ba51ec3933ca7dc44ed6d79294e0e76e53ca83bea3d3b327e70830fcc8d1cac0b75a0b7d030e94a7dec6b14e'
        '2c3fb2af6c8e92bcacb15b3878b1125fd4f8b4d48e37b2b3ce818517b7a7a94f68ef3c155e8d8cb5b2d39727fe916e293b892c48ee59167b4ee564bbedc70d9d')
b2sums_x86_64=('590a22fefc3c6789adf0d7e9af2afaa932f98ee151f88d6770cc9e4487072ec13e98b89d49e98eb0793fe81ac1bd9dbee817055218a9c4a96b0ad0f69276b93f')

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
