# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Mix <mnixry@outlook.com>
# Contributor: jdev082 <jdev0894@gmail.com>
# Contributor: Erde <erkkah@gmail.com>
# Contributor: Solomon Choina <shlomochoina@gmail.com>

_pkgauthor=Eugeny
_pkgname=tabby
pkgname=${_pkgname}-bin
pkgver=1.0.233
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Tabby (formerly Terminus) is a highly configurable terminal emulator, SSH and serial client for Windows, macOS and Linux"
arch=('x86_64' 'aarch64')
_barch=('x64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

depends=('bash' 'nodejs' 'python' 'dbus' 'pango' 'alsa-lib' 'nss' 'nspr' 'systemd-libs' 'libxext' 'expat' 'libxcomposite' 'libxrandr' 'libxfixes' 'libxdamage' 'libsecret' 'cairo' 'gtk3' 'fontconfig' 'glib2' 'libxcb' 'libcups')
optdepends=('gnome-keyring')
provides=("tabby" "tabby-terminal")
conflicts=("tabby")

options=('!strip' '!debug')
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-linux-${_barch[0]}.deb")
source_aarch64=("${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-linux-${_barch[1]}.deb")
sha256sums=('ac295694b9f56e90dce3cf58313ed891d0bd9178adec02d8503a0c07d9d34c68'
            '486a44e5d65820e6fe9789bf0835e7fba1ddbd1088ff43e5d9682e835a5c4a53')
sha256sums_x86_64=('2a9afbeaca1fdab9d548d59c138f77b3851da44e2f5a250298280c395cbe45c1')
sha256sums_aarch64=('a4e32f0582e94afa07aebc2974fc0f9fffd781b5dcc9c82e248b1f12cd48ec30')

package() {
  bsdtar -xf data.tar.xz -C "${pkgdir}/"

  mv "${pkgdir}/usr/share/doc/tabby-terminal" "${pkgdir}/usr/share/doc/${pkgname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" <<END
  #!/usr/bin/bash
  /opt/Tabby/tabby

  chown root:root /opt/Tabby/chrome-sandbox
  chmod 4755 /opt/Tabby/chrome-sandbox

END
}
