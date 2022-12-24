# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=protonup-qt
pkgver=2.7.7
pkgrel=1
pkgdesc="Install and manage Proton-GE and Luxtorpeda for Steam and Wine-GE for Lutris"
arch=('any')
url="https://davidotek.github.io/protonup-qt"
license=('GPL3')
depends=('pyside6' 'python-inputs' 'python-psutil' 'python-requests'
         'python-steam' 'python-vdf' 'python-pyxdg' 'python-pyaml' 'qt6-tools')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DavidoTek/ProtonUp-Qt/archive/refs/tags/v$pkgver.tar.gz"
        'net.davidotek.pupgui2.sh')
sha256sums=('2c6e61a1f6734b3c79dec7f91b0d61835069743e4382a3ff8840791475d0f6d4'
            '732fd88026a801d64ffb85c98c1bc53536100524cced87ab86a112d83de07c1f')

build() {
  cd "ProtonUp-Qt-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "ProtonUp-Qt-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  cp -r share "$pkgdir/usr/"

  install -Dm755 "$srcdir/net.davidotek.pupgui2.sh" "$pkgdir/usr/bin/net.davidotek.pupgui2"
  ln -s /usr/bin/net.davidotek.pupgui2 "$pkgdir/usr/bin/$pkgname"
}
