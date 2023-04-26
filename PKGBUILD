# Maintainer: Pierre Rossi <pierre.rossi@pm.me>

pkgname='airconnect-bin'
pkgver=1.1.1
pkgrel=1
pkgdesc='Use AirPlay to stream to UPnP/Sonos & Chromecast devices'
arch=(any)
url='https://github.com/philippe44/AirConnect'
license=('MIT')

arch=('x86_64')

source=("https://raw.githubusercontent.com/philippe44/AirConnect/1.1.1/bin/airupnp-linux-x86_64")

sha256sums=('34a809862f5dffc9a18d3942d635fe95c8af946294cac183a3cfdfefd90bed21')

package() {
  cat <<EOF > "${srcdir}/airupnp@.service"
[Unit]
Description=AirUPnP bridge
After=network-online.target
Wants=network-online.target

[Service]
User=%i
ExecStart=/var/lib/airconnect/airupnp -l 1000:2000 -Z
Restart=on-failure
RestartSec=30

[Install]
WantedBy=multi-user.target

EOF


  install -D -m 755 "${srcdir}/airupnp-linux-x86_64" "${pkgdir}/var/lib/airconnect/airupnp"
  install -D -m 755 "${srcdir}/airupnp@.service" "${pkgdir}/usr/lib/systemd/system/airupnp@.service"

}
