# Maintainer: agony <27015 at riseup dot net>
# Contributor: Gaoyang Zhang <gy@blurgy.xyz>

pkgname=wakapi-bin
pkgver=2.18.2
pkgrel=1
pkgdesc='A minimalist, self-hosted WakaTime-compatible backend for coding statistics'
arch=('x86_64')
url='https://github.com/muety/wakapi'
license=('GPL-3.0')
provides=('wakapi')
conflicts=('wakapi')
source=('https://raw.githubusercontent.com/muety/wakapi/master/LICENSE')
source_x86_64=("wakapi-${pkgver}-amd64.zip::${url}/releases/download/${pkgver}/wakapi_linux_amd64.zip")
sha256sums=('852bcc033a46c62f99fb5ffd43b3241ba2c0c440c6034aa2114505f2c4f03c4a')
sha256sums_x86_64=('a64e98f0a99ae4dd625ed3bff5b98e3b21130d2adc04184bfbbe35f21049273b')

package() {
  install -Dm755 wakapi -t "${pkgdir}/usr/bin"
  install -Dm644 config.yml -t "${pkgdir}/etc/wakapi"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/wakapi/LICENSE"
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  cat >"${pkgdir}/usr/lib/systemd/system/wakapi.service" <<EOF
[Unit]
Description=wakapi server
After=network.target

[Service]
ExecStart=wakapi -config /etc/wakapi/config.yml

[Install]
WantedBy=multi-user.target
EOF
}
