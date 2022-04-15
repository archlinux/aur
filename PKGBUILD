pkgname=gnome-shell-extension-wireguard-indicator
pkgver=8
pkgrel=1
pkgdesc="Manage WireGuard VPN from Desktop"
arch=(any)
url="https://github.com/atareao/wireguard-indicator"
license=(MIT)
depends=('gnome-shell>=40.0')
makedepends=(jq)
source=("${pkgname}-${pkgver}.zip::https://extensions.gnome.org/extension-data/wireguard-indicatoratareao.es.v${pkgver}.shell-extension.zip")
sha256sums=('c5b768d81bdecc7581b85bb4b16e97e9b809790f07527c0bbeb3a0b04ff30545')

package() {
  rm "${pkgname}-${pkgver}.zip"

  _uuid="$(cat metadata.json | jq --raw-output '.uuid')"
  _dest_dir="/usr/share/gnome-shell/extensions/${_uuid}"

  mkdir -p "${pkgdir}/${_dest_dir}"
  cp -r * "${pkgdir}/${_dest_dir}"

  # Fix permission issue
  chmod a+r "${pkgdir}/${_dest_dir}/metadata.json"
}
