# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Maintainer: tee < teeaur at duck dot com >

_pkgname="ipfs-desktop"
pkgname="${_pkgname}-bin"
pkgver=0.47.0
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
b2sums=('c8022253feae12faf10b9a4796b478d0f031c46b447068f98b7785d95a3f42633cd42700098d2934fd0adc89ae1fde3589ee489399e1b8e582838304d26e8653'
        '907aa96f8f51db2434295a519cc6bb85987f8c2f95eba359b97ebbe65526ec5f3c79a2bc48c8d971bd531ebf114e5bdbde88e903e73c1461d80f5fa7dac88d7e'
        '2c3fb2af6c8e92bcacb15b3878b1125fd4f8b4d48e37b2b3ce818517b7a7a94f68ef3c155e8d8cb5b2d39727fe916e293b892c48ee59167b4ee564bbedc70d9d')
b2sums_x86_64=('4d7a60b9598c86e02e3ab741ab433fee059ac968ceb147e23f2440b7ce83cf891810e909acb142f7829e746727f7774cabac45c0fe50d0a62ac4edd242e9a495')

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
