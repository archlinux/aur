# Maintainer: <mmoya at mmoya dot org>
#
pkgname=hydrascale-bin
pkgver=1.7.0
pkgrel=1
pkgdesc='Run multiple Tailscale tailnets simultaneously on a single Linux machine.'
arch=('x86_64')
url='https://github.com/Crank-Git/Hydrascale'
license=('MIT')
_filename="hydrascale_${pkgver}_linux_amd64.tar.gz"
source=("${url}/releases/download/v${pkgver}/${_filename}")
sha256sums=('2dee9f318c2d8658319f4903b4be9f9d3910870fbd2a1fa9a19ff913b03a4021')
options=('!debug')

package() {
    tar -xz -f "${_filename}"

    install -Dm644 contrib/example-config.yaml "${pkgdir}/etc/hydrascale/example-config.yaml"

    install -Dm755 hydrascale "${pkgdir}/usr/bin/hydrascale"
    sed -E '/^ExecStart/s,local/bin,bin,' contrib/hydrascale.service |
        install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/system/hydrascale.service"
}
