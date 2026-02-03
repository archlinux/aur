# Maintainer: Deon Spengler <deon@spengler.co.za>
# Contributer: Janis Jansons <aur@janhouse.lv>

pkgname=ledfx-git
pkgver=v2.1.4.r0.g264df627
pkgrel=1
pkgdesc="Make your LEDs dance in sync to the music"
arch=('any')
url="https://github.com/LedFx/LedFx"
license=(GPL-3.0-only)
depends=('python' 'python-numpy' 'python-netifaces' 'python-aubio-ledfx' 'python-pybase64' 'python-sacn' 'python-aiohttp-cors' 'python-sentry_sdk' 'python-psutil' 'python-samplerate-ledfx' 'python-sounddevice' 'python-rtmidi' 'python-mss' 'python-openrgb-git' 'python-osc' 'python-vnoise' 'python-flux-led' 'python-lifx-async' 'python-webcolors' 'python-xled' 'python-netaddr' 'python-pyzmq' 'python-stupidartnet')
provides=('ledfx')
conflicts=('ledfx')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pdm-backend')
source=("ledfx-git::git+https://github.com/LedFx/LedFx.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
    cd "ledfx-git"
    python -m build --wheel --no-isolation
}

package() {
    cd "ledfx-git"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

