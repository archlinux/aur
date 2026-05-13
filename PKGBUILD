# Maintainer: Zosma AI <info@zosma.ai>
# Contributor: Arjun Nayak <arjun@zosma.ai>

pkgname=zosma-cowork-bin
pkgver=0.8.3
pkgrel=1
pkgdesc="Desktop AI coworker built on the pi coding agent — streaming, thinking, tool calls"
arch=('x86_64')
url="https://github.com/zosmaai/zosma-cowork"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'librsvg')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("zosma-cowork-${pkgver}.deb::${url}/releases/download/v${pkgver}/zosma-cowork_${pkgver}_amd64.deb")
sha256sums=('91882c0ee9ea356350caff4f40626a422523317ce864a90d76501597b8eb17c5')
options=('!strip')

package() {
  cd "${srcdir}"
  # .deb is an ar archive containing data.tar.gz with the actual files
  ar x "${srcdir}/${pkgname%-bin}-${pkgver}.deb"
  bsdtar -xf data.tar.gz -C "${pkgdir}"

  # Ensure binary is executable
  if [[ -f "${pkgdir}/usr/bin/zosma-cowork" ]]; then
    chmod +x "${pkgdir}/usr/bin/zosma-cowork"
  fi
}
