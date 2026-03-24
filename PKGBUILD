# Maintainer: Christopher Ritsen <chris.ritsen@gmail.com>
_name='netaudio-lib'
pkgname='python-netaudio'
pkgver=0.0.7
pkgrel=1
pkgdesc="Python library for controlling Audinate Dante network audio devices"
arch=(any)
url='https://github.com/chris-ritsen/network-audio-controller'
license=(Unlicense)
depends=('python' 'python-zeroconf' 'python-ifaddr' 'python-sqlitedict')
optdepends=('python-pynacl: device lock/unlock')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('eaa3e3d7688e0c44384b82334e3ff1cf7f463b100853654c3c6df1013013b3d6')

build() {
    cd "${_name//-/_}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name//-/_}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
