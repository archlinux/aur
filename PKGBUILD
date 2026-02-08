# Maintainer: Deon Spengler <deon@spengler.co.za>

pkgname=ledfx
pkgver=2.1.5
pkgrel=2
pkgdesc="Network based LED effect controller"
arch=(any)
url="https://github.com/LedFx/LedFx"
license=(GPL-3.0-only)
depends=('python' 'python-numpy' 'python-netifaces' 'python-aubio-ledfx' 'python-pybase64' 'python-sacn' 'python-aiohttp-cors' 'python-sentry_sdk' 'python-psutil' 'python-samplerate-ledfx' 'python-sounddevice' 'python-rtmidi' 'python-mss' 'python-openrgb' 'python-osc' 'python-vnoise' 'python-flux-led' 'python-lifx-async' 'python-webcolors' 'python-xled' 'python-netaddr' 'python-pyzmq' 'python-stupidartnet' 'python-voluptuous' 'python-dotenv' 'python-zeroconf' 'python-paho-mqtt' 'python-icmplib' 'python-requests-toolbelt' 'python-tornado')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pdm-backend')
source=("https://github.com/LedFx/LedFx/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fef0d190c41ae6fc10cb775439c6ed1e05a935494f1558fbb966c7c70c973105')

build() {
    cd "LedFx-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "LedFx-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    cat > "$pkgdir/usr/bin/ledfx" << 'EOF'
#!/bin/bash
IS_RELEASE=true exec -a ledfx python3 -m ledfx "$@"
EOF
}
