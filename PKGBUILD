# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Mix <mnixry@outlook.com>
# Contributor: jdev082 <jdev0894@gmail.com>
# Contributor: Erde <erkkah@gmail.com>
# Contributor: Solomon Choina <shlomochoina@gmail.com>

_pkgauthor=Eugeny
_pkgname=tabby
pkgname=${_pkgname}-bin
pkgver=1.0.234
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
            '6b960b6fd9aa9efde2c697fc41f7bbe3aafb2a67a02c18eadbd81c00b3f4ed91')
sha256sums_x86_64=('1872080af06c962347c7a5411de682478e087df33eae67c2b57a517461702fd4')
sha256sums_aarch64=('c17ef293cb0a0bb3305792e7c0ccfa91ba319ac4ca44ce72ce5e1ba86bbd1b68')

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
