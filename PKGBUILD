pkgname=gnome-shell-extension-wireguard-indicator
pkgver=9
pkgrel=1
pkgdesc="Manage WireGuard VPN from Desktop"
arch=(any)
url="https://github.com/atareao/wireguard-indicator"
license=(MIT)
depends=('gnome-shell>=40.0')
makedepends=(jq)
source=("${pkgname}-${pkgver}.zip::https://extensions.gnome.org/extension-data/wireguard-indicatoratareao.es.v${pkgver}.shell-extension.zip")
sha256sums=('d7290b9934394298c4c5fc5c041a292850b7cee71d26a3074c26434635e30d17')

package() {
  rm "${pkgname}-${pkgver}.zip"

  _uuid="$(cat metadata.json | jq --raw-output '.uuid')"
  _dest_dir="/usr/share/gnome-shell/extensions/${_uuid}"

  mkdir -p "${pkgdir}/${_dest_dir}"
  cp -r * "${pkgdir}/${_dest_dir}"

  # Fix permission issue
  chmod a+r "${pkgdir}/${_dest_dir}/metadata.json"
}
