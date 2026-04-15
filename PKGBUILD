# Maintainer: tobast <contact at tobast dot fr>

pkgname=choria-cm
pkgver=0.0.26
pkgrel=1
pkgdesc="Choria Configuration Management"
arch=('any')
url="https://github.com/choria-io/ccm"
license=('Apache-2.0')
depends=()
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('325ce8f336c38a205d84a3c1988e5a231581551c16cbf090905bda6c57b7d0b9')
backup=('etc/choria/ccm/agent.yaml')

_archive_name='ccm'

build() {
    cd "$srcdir/${_archive_name}-${pkgver}"
	go build -o ccm -ldflags="-s -w -X 'main.version=${pkgver}'" ./cmd
}

package() {
    cd "$srcdir/${_archive_name}-${pkgver}"

    install -D -m644 "./LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m755 "./ccm" "$pkgdir/usr/bin/ccm"
    install -D -m644 './build/ccm-agent.service' "$pkgdir/usr/lib/systemd/system/ccm-agent.service"
    install -D -m644 './build/agent.yaml' "$pkgdir/etc/choria/ccm/agent.yaml"
}
