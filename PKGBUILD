# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=keepmenu
pkgver=1.3.1
pkgrel=1
pkgdesc="dmenu/rofi frontend for KeePass databases"
arch=('any')
url="https://github.com/firecat53/keepmenu"
license=('GPL3')
depends=('python' 'python-pykeepass' 'python-pynput')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
optdepends=('dmenu: either dmenu or rofi is required'
            'rofi: either dmenu or rofi is required'
            'xdotool: required for typing non-U.S. Unicode characters')

source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('8214f609403acabe26f3e2efcff8ac7bf48a80bbd55bf105251c6cf2619be19f')
install=${pkgname}.install

build() {
  cd "${pkgname}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 keepmenu.1 "${pkgdir}/usr/share/man/man1/keepmenu.1"
}
