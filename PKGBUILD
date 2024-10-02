# Maintainer: Jorge Hernández <jfernandohernandez28@gmail.com>
pkgname="battery-advisor"
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple tool to monitor and notify about battery status. Built with Python."
arch=('any')
url="https://github.com/fer-hnndz/battery-advisor"
license=('MIT')
depends=("python" "python-psutil" "python-toml" "python-gobject" "libnotify" "python-pystray")
backup=("etc/battery-advisor/defaultSettings.toml")
makedepends=(python-build python-installer python-wheel)
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=(d4a6f15ded5961d37566e232fccdc4b52d25ea545d67697f55da6778aa5a8205)
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

    # Install the defaultSettings.toml file to /etc/battery-advisor
    install -Dm644 "$srcdir/battery_advisor-$pkgver/defaultSettings.toml" "$pkgdir/etc/battery-advisor/defaultSettings.toml"

    # Install license
    install -Dm644 "$srcdir/battery_advisor-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
