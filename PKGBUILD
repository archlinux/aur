# Maintainer: Christopher Ritsen <chris.ritsen@gmail.com>
# Maintainer: SecByShresth <Shresthpaul133@gmail.com>
pkgname='python-netaudio'
pkgver=0.2.4
pkgrel=1
pkgdesc="Python library for controlling Audinate Dante network audio devices"
arch=(any)
url='https://github.com/chris-ritsen/network-audio-controller'
license=(Unlicense)
depends=('python' 'python-zeroconf' 'python-ifaddr' 'python-sqlitedict')
optdepends=('python-pynacl: device lock/unlock')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/n/netaudio/netaudio-${pkgver}.tar.gz")
sha256sums=('46bddcef59da83076f1114d9a83a4efdd54afc94b66593ad01a08922161f9b28')

build() {
    cd "netaudio-${pkgver}"  # Directory name is 'netaudio-0.2.4' after extraction
    python -m build --wheel --no-isolation
}

package() {
    cd "netaudio-${pkgver}"  # Same here, cd to the right directory after extraction
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
