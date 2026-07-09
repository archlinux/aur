# Maintainer: Deon Spengler <deon@spengler.co.za>

pkgname=ledfx
pkgver=2.1.9
pkgrel=1
pkgdesc="Network based LED effect controller"
arch=(any)
url="https://github.com/LedFx/LedFx"
license=(GPL-3.0-only)
depends=(
    'python'
    'python-numpy'
    'python-cffi'
    'python-aiohttp'
    'python-aiohttp-cors'
    'python-aubio-ledfx'
    'python-certifi'
    'python-multidict'
    'python-openrgb'
    'python-paho-mqtt'
    'python-psutil'
    'python-pyserial'
    'python-pystray'
    'python-rtmidi'
    'python-requests'
    'python-sacn'
    'python-sentry_sdk'
    'python-sounddevice'
    'python-icmplib'
    'python-voluptuous'
    'python-zeroconf'
    'python-pillow'
    'python-flux-led'
    'python-lifx-async'
    'python-osc'
    'python-pybase64'
    'python-mss'
    'python-stupidartnet'
    'python-dotenv'
    'python-pyfastnoiselite'
    'python-netifaces2'
    'python-packaging'
    'python-xled'
    'python-samplerate-ledfx'
    'python-audio-hotplug'
    'python-uvloop'
    'python-dbus-fast'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pdm-backend')
source=("https://github.com/LedFx/LedFx/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d380bd204c47ad15331da237241544ebe4ef75feddae96c97016d5db7c14f7cf')

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
