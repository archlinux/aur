# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# contributer: Cameron Spear <cam@cameronspear.com>
pkgname=docker-local-persist-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Create named local docker volumes that persist in the location(s) you want"
arch=('x86_64')
url="https://github.com/MatchbookLab/local-persist"
license=('MIT')
binname=("local-persist-linux-amd64")
source=("${url}/releases/download/v${pkgver}/${binname}")
sha256sums=('bdfe36888d9350a7fb067e44ca11bd52b9106cbc793032901c25c4b237ecb3a3')

package() {
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/lib/systemd/system
  install -Dm755 ../${binname} ${pkgdir}/usr/bin/docker-volume-local-persist
echo -e "[Unit]
Description=docker-volume-local-persist
Before=docker.service
Wants=docker.service

[Service]
TimeoutStartSec=0
ExecStart=/usr/bin/docker-volume-local-persist

[Install]
WantedBy=multi-user.target" > ../docker-volume-local-persist.service
 install -Dm644 ../docker-volume-local-persist.service ${pkgdir}/usr/lib/systemd/system/docker-volume-local-persist.service
}
