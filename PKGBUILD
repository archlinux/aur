# Maintainer: Christopher Ritsen <chris.ritsen@gmail.com>
_name='netaudio'
pkgname='python-netaudio'
pkgver=0.1.5
pkgrel=1
pkgdesc="CLI for controlling Audinate Dante network audio devices"
arch=(any)
url='https://github.com/chris-ritsen/network-audio-controller'
license=(Unlicense)
depends=('python' 'python-netaudio-lib' 'python-typer' 'python-rich')
optdepends=('python-redis: packet capture features'
            'python-pyyaml: YAML output format'
            'tshark: live network capture')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "netaudio.service::https://raw.githubusercontent.com/chris-ritsen/network-audio-controller/master/systemd/netaudio.service")
sha256sums=('a4d35200127c3d2a681918ce24934518be352cbad1dd2f09c0be45bef3d1adb1'
            'SKIP')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 "$srcdir/netaudio.service" "$pkgdir/usr/lib/systemd/user/netaudio.service"
}
