# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Maintainer: tee < teeaur at duck dot com >

_pkgname="ipfs-desktop"
pkgname="${_pkgname}-bin"
pkgver=0.46.2
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
b2sums=('7e70bb519c6bf64afe4fbf667fd632f98489b15bec4dd7a7574d0182becff4d869ff620f71ee9f8e3d94aa3ab6fc8170f84247af2b2a8f28a4111983681ce0ea'
        '8b3a57abc8f5a0748d3e90deb7511eb7b5c7514f60cdb1029e24016b85fe2584fe32797ea6c2ccb41d1af1644c50b77b5148831db23edc0ef9f7a35f9b2a5b03'
        '2c3fb2af6c8e92bcacb15b3878b1125fd4f8b4d48e37b2b3ce818517b7a7a94f68ef3c155e8d8cb5b2d39727fe916e293b892c48ee59167b4ee564bbedc70d9d')
b2sums_x86_64=('4b177db9977d92b7354cd6c576a410c53d70334a0f868894d813bb8ac334f11930a57d13ced5cc814481393449df09f9b6f167831b4d6d849f96fe51bef36d39')

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
