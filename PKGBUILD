# Maintainer: Jorge Hernández <jfernandohernandez28@gmail.com>
pkgname="python-battery-advisor"
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple tool to monitor and notify about battery status. Built with Python."
arch=('any')
url="https://github.com/fer-hnndz/battery-advisor"
license=('MIT')
depends=("python")
backup=("etc/battery-advisor/defaultSettings.toml")
makedepends=(python-build python-installer python-wheel)
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=("e85608ed5c7674a0d682cc36a5ce360c91871e9c481157ddf84e66ff7cb47590")
validpgpkeys=()

prepare() {
    cd "$srcdir/${_name//-/_}-$pkgver"
}

build() {
    cd "$srcdir/${_name//-/_}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_name//-/_}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install the defaultSettings.toml file to /etc/battery-advisor/
    install -Dm644 "$srcdir/battery_advisor-$pkgver/defaultSettings.toml" "$pkgdir/etc/battery-advisor/defaultSettings.toml"
}
