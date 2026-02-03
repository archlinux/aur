# Maintainer: Deon Spengler <deon@spengler.co.za>

pkgname=ledfx
pkgver=2.1.4
pkgrel=1
pkgdesc="Network based LED effect controller"
arch=(any)
url="https://github.com/LedFx/LedFx"
license=(GPL-3.0-only)
depends=('python' 'python-numpy' 'python-netifaces' 'python-aubio-ledfx' 'python-pybase64' 'python-sacn' 'python-aiohttp-cors' 'python-sentry_sdk' 'python-psutil' 'python-samplerate-ledfx' 'python-sounddevice' 'python-rtmidi' 'python-mss' 'python-openrgb-git' 'python-osc' 'python-vnoise' 'python-flux-led' 'python-lifx-async' 'python-webcolors' 'python-xled' 'python-netaddr' 'python-pyzmq' 'python-stupidartnet')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pdm-backend')
source=("https://github.com/LedFx/LedFx/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('015826f13265a4d654ca0bdb47d4a88d0c8b765227017070f5dd01663130ac3e')

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
