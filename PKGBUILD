# Maintainer: Zosma AI <info@zosma.ai>
# Contributor: Arjun Nayak <arjun@zosma.ai>

pkgname=zosma-cowork-bin
pkgver=0.15.2
pkgrel=1
pkgdesc="Desktop AI coworker built on the pi coding agent — streaming, thinking, tool calls"
arch=('x86_64')
url="https://github.com/zosmaai/zosma-cowork"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'librsvg')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("zosma-cowork-${pkgver}.deb::${url}/releases/download/v${pkgver}/zosma-cowork_${pkgver}_amd64.deb")
sha256sums=('46c8b40691dcdd86e912aebc45b723f7ec8f2adf877189db1c00f881fb0262e6')
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
