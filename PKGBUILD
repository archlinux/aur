# Maintainer: ocean117<shuaizhy at qq dot com>

pkgname=soteria-bin
_pkgname=soteria
pkgver=0.3.1
pkgrel=1
pkgdesc="A GTK-based polkit authentication agent (prebuilt binary)"
arch=('x86_64')
url="https://github.com/ImVaskel/soteria"
license=('Apache-2.0')

depends=('gtk4' 'polkit')

provides=('soteria')
conflicts=('soteria' 'soteria-git')
install=soteria-bin.install

source=(
  "${_pkgname}-${pkgver}-linux-${CARCH}.tar.gz::https://github.com/ocean-sudo/soteria/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-${CARCH}.tar.gz"
  "soteria.service"
  "soteria-bin.install"
)

sha256sums=(
  '9050e3d379734b0475aa8c86134c4b9c3821c896934cfb0250170eef678c2b3e'
  'SKIP'
  'SKIP'
)

package() {
  cd "$srcdir"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/lib/soteria-polkit/${_pkgname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  if [[ -f NOTICE ]]; then
    install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
  fi

  install -Dm644 soteria.service \
    "${pkgdir}/usr/lib/systemd/user/soteria.service"
}
