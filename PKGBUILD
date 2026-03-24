# Maintainer: Christopher Ritsen <chris.ritsen@gmail.com>
_name='netaudio'
pkgname='netaudio'
pkgver=0.1.6
pkgrel=1
pkgdesc="CLI for controlling Audinate Dante network audio devices"
arch=(any)
url='https://github.com/chris-ritsen/network-audio-controller'
license=(Unlicense)
depends=('python' 'python-netaudio' 'python-typer' 'python-rich' 'python-pyyaml')
optdepends=('python-redis: packet capture features'
            'wireshark-cli: live network capture')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "netaudio.service::https://raw.githubusercontent.com/chris-ritsen/network-audio-controller/master/systemd/netaudio.service")
sha256sums=('cfc5fa35b94e3948525a44067e2584d9667117b35ac6e1ffb76b1f5f9e7a57bd'
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
