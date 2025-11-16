# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: SierraKiloBravo <aur at hillebrand dot io>

_pkgname=vieb
pkgname=${_pkgname}-bin
pkgver=12.6.0
pkgrel=1
pkgdesc="Vim Inspired Electron Browser - Vim bindings for the web by design"
arch=('x86_64')
url="https://github.com/Jelmerro/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/Jelmerro/${_pkgname}/${pkgver}"
license=('GPL-3.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('gcc-libs' 'glibc' 'gtk3' 'glib2' 'libx11' 'libxext' 'libxkbcommon' 'libxcb' 'pango' 'libxcomposite' 'nss' 'expat' 'systemd-libs' 'alsa-lib' 'nspr' 'at-spi2-core' 'cairo' 'libxfixes' 'libxrandr' 'mesa' 'libxdamage' 'libcups' 'dbus' 'hicolor-icon-theme')

options=(!strip)

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.pacman")
sha512sums=('d361e5e8201481c6346ee6a886592c51265112be550d5224f1a7a6e116255c2f1ab8788df579d9b8372ed7bfd19bac4b6e70e00b472642966ab5b319b99a2686'
            'bd1fa731b5379466b0f5f138f0abb689c5ba259778328d289624ec1d31f190eba28413230d182b001af713afa6e288f304016ec1b3b5a92293f5dea78fc4a0dd')
sha512sums_x86_64=('480d464a291bda8e311bda6c6abae564a97bfd1044009372b4146060ed0a450f42ea6f9642579c373eac73165a11f3007752746be41a8c943c6a6f7aef166d9b')

package() {
  cd "$srcdir"

  cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
  cp -R "${srcdir}/opt/" "${pkgdir}/opt/"

  chmod 4755 "${pkgdir}/opt/Vieb/chrome-sandbox"

  # Create a symlink to the binary in /opt
  install -dm755 "${pkgdir}/usr/bin/"
  ln -sf "/opt/Vieb/vieb" "${pkgdir}/usr/bin/${_pkgname}"
}
