# Maintainer: Dragonir <dragonir44@gmail.com>
pkgname=phone-mirror
_pyname=phone_mirror
pkgver=0.1.0
pkgrel=1
pkgdesc="Mirror an Android phone or use its camera as a webcam, over Wi-Fi or USB (Qt front-end for scrcpy)"
arch=('any')
url="https://github.com/Dragonir44/phone-mirror"
license=('MIT')
depends=('python' 'pyside6' 'scrcpy' 'android-tools')
optdepends=(
  'v4l2loopback-dkms: phone camera as a webcam (not needed if your kernel ships v4l2loopback, e.g. CachyOS)'
  'qt6-tools: keep the mirror window on top under KDE Plasma Wayland (qdbus6)'
  'libnotify: desktop notifications (notify-send)'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('1b51b883998645b92000fbee28f8b270a20f0254b08c7fe130fa8e1352b59bfb')

build() {
  cd "$srcdir/${_pyname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_pyname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 phone_mirror/data/phone-mirror.desktop \
    "$pkgdir/usr/share/applications/phone-mirror.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
