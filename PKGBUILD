# Maintainer: Christopher Ritsen <chris.ritsen@gmail.com>
_name='netaudio-lib'
pkgname='python-netaudio-lib'
pkgver=0.0.6
pkgrel=1
pkgdesc="Python library for controlling Audinate Dante network audio devices"
arch=(any)
url='https://github.com/chris-ritsen/network-audio-controller'
license=(Unlicense)
depends=('python' 'python-zeroconf' 'python-ifaddr')
optdepends=('python-sqlitedict: mDNS caching'
            'python-pynacl: device lock/unlock')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/netaudio_lib-${pkgver}.tar.gz")
sha256sums=('353a4102168047f5330fd4f961b3ba95da409961bfa6354d1ad37e65873407fd')

build() {
    cd "netaudio_lib-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "netaudio_lib-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
