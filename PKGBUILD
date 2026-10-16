# Maintainer: Deon Spengler <deon@spengler.co.za>

pkgname=akp02d
pkgver=1.0.0
pkgrel=1
pkgdesc="Themed system stats display for the Ajazz AKP02 panel, with a live theme editor"
arch=('any')
url="https://github.com/deonspengler/akp02d"
license=('GPL-3.0-or-later')
depends=('python>=3.13' 'python-akp02>=2.0.0' 'python-pillow' 'cava' 'pyside6')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-wheel')
optdepends=('playerctl: the now_playing source and cover art'
            'libpulse: the volume source (pactl; works with PipeWire too)')
install=akp02d.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/deonspengler/akp02d/archive/refs/tags/v$pkgver.tar.gz"
        "akp02d.service"
        "akp02d-edit.desktop")
sha256sums=('ee1e9a0915b929715a24e1c4bf6f118f7c231ac93abe0aef6475abc3418818ab'
            'c0a3928970f8289cb652a5e96d39e74717c84f9f71549d8f818d00d9b2db0a9d'
            'c9a5b4839c4b1b21c925010a99c299345b1f66c4ca8493941bb4f3bb3a941c76')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "$srcdir/akp02d.service" "$pkgdir/usr/lib/systemd/user/akp02d.service"
  install -Dm644 "$srcdir/akp02d-edit.desktop" "$pkgdir/usr/share/applications/akp02d-edit.desktop"
}
