# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=i3-volume
pkgver=4.0.0
pkgrel=1
pkgdesc="Volume control and volume notifications for i3wm"
arch=(any)
url="https://github.com/hastinbe/i3-volume"
license=('GPL-2.0-only')
depends=('bash' 'bc' 'jq' 'pipewire' 'wireplumber')
optdepends=('libnotify: notifications via notify-send'
            'dunst: notifications via dunstify'
            'pipewire-audio: feedback sounds via pw-play')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hastinbe/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('442746aaa6c4434b9401887fe01c7e228f9ade080fca7a26164d8842a52dece2')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 volume "${pkgdir}/usr/lib/i3-volume/volume"
  install -Dm644 -t "${pkgdir}/usr/lib/i3-volume/lib" lib/*.sh
  install -Dm755 -t "${pkgdir}/usr/lib/i3-volume/plugins/notify" plugins/notify/*
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /usr/lib/i3-volume/volume "${pkgdir}/usr/bin/i3-volume"
  install -Dm644 -t "${pkgdir}/usr/share/doc/i3-volume" README.md MANUAL.md example.conf
  install -Dm644 -t "${pkgdir}/usr/share/doc/i3-volume/examples" examples/*
}

# vim:set ts=2 sw=2 et:
