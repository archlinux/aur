# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=flaresolverr-bin
_pkgname="${pkgname%-bin}"
__pkgname=FlareSolverr
pkgver=3.5.2
pkgrel=1
pkgdesc='A proxy server to bypass Cloudflare protection'
arch=(x86_64)
url='https://github.com/FlareSolverr/FlareSolverr'
license=('MIT')
depends=(
  alsa-lib
  at-spi2-core
  bash
  bzip2
  cairo
  dbus
  expat
  gcc-libs
  glib2
  glibc
  libcups
  libdrm
  libffi
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxkbcommon
  libxrandr
  mesa
  nspr
  nss
  openssl
  pango
  readline
  util-linux-libs
  xorg-server-xvfb
  xz
  zlib
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip !debug)
install=flaresolverr.install
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/${__pkgname}/${__pkgname}/releases/download/v${pkgver}/${_pkgname}_linux_x64.tar.gz"
  "https://raw.githubusercontent.com/${__pkgname}/${__pkgname}/v${pkgver}/LICENSE"
  flaresolverr.service
  flaresolverr.sysusers
  flaresolverr.tmpfiles
  flaresolverr.install
)
sha256sums=('84f6df48849b2e1742692841805c4f284118fe4e2798b49d3a78159e89a46a91'
            '822369fb1f97651e6d0b00128451987e0ce98adc3007dc886db68adbf891d2da'
            '98379aef64fb530a22bcd949ead5cefc66c745bc683e5cedb37be371ae25eab8'
            '62f114d4e559cf9dae22bfd90759eff697e42da5f700a52988e70e78f3048ae2'
            '4a61a6d9db1a9f4ec0812d86ef524a7f575a45f272404f0ebfc79376628feeb2'
            '8df556eb3a6c0d42419b21f6f1396f0e5f1222b7b4a187b7cb26ad3f5a0160b5')

package() {
  install -dm755 "${pkgdir}/opt/flaresolverr"

  cp -dr "${_pkgname}" "${pkgdir}/opt"
  rm "${pkgdir}/opt/flaresolverr/_internal/libreadline.so.8"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 flaresolverr.service "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm644 flaresolverr.sysusers "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -Dm644 flaresolverr.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
