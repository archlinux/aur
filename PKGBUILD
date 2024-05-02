# Maintainer: Gaoyang Zhang <gy@blurgy.xyz>
pkgname=wakapi-bin
pkgver=2.11.1
pkgrel=1
epoch=
pkgdesc="A minimalist, self-hosted WakaTime-compatible backend for coding statistics"
arch=("x86_64")
url="https://github.com/muety/wakapi"
license=('GPL-3.0')
groups=()
depends=()
makedepends=(
  unzip
)
checkdepends=()
optdepends=()
provides=("wakapi")
conflicts=("wakapi")
replaces=()
backup=()
options=()
install=
changelog=
source=(
  "wakapi-${pkgver}.zip::https://github.com/muety/wakapi/releases/download/${pkgver}/wakapi_linux_amd64.zip"
  "https://raw.githubusercontent.com/muety/wakapi/master/LICENSE"
)
b2sums=(
  '204e6720c62d84cca25130108a76578ce811877a97f6bf84cecf622532cddaaca503a20200863f409b58093ff3584f151a0efca7f8deb889fb413b719f03081b'
  '70b100a6a08c18dd710d0ac9ae59acfb3fa9c6a02ff7090f59dfa94f41dd648a9f2e02fec6ba96cbe607c1ffcab3d9430366f45291649e033457ed436d9603fd'
)
noextract=()
validpgpkeys=()

package() {
  unzip -o "wakapi-${pkgver}.zip"
  install -Dm755 "wakapi" "${pkgdir}/usr/bin/wakapi"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/wakapi/LICENSE"
  install -Dm644 "config.yml" "${pkgdir}/etc/wakapi/config.yml"
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
