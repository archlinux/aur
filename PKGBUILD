# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname=keepmenu
pkgver=1.6.0
pkgrel=1
pkgdesc="dmenu/rofi frontend for KeePass databases"
arch=('any')
url="https://github.com/firecat53/keepmenu"
license=('GPL-3.0-only')
depends=('python' 'python-pykeepass')
makedepends=('python-build' 'python-installer' 'python-hatchling')
optdepends=('python-pynput: autotyping with the default type_library'
            'dmenu: dmenu backend'
            'bemenu: bemenu backend'
            'fuzzel: fuzzel backend'
            'wmenu: wmenu backend'
            'rofi: rofi backend'
            'wofi: wofi backend'
            'yofi: yofi backend'
            'tofi: tofi backend'
            'xdotool: required for typing non-U.S. Unicode characters'
            'wtype: required for typing non-U.S. Unicode characters'
            'ydotool: required for typing non-U.S. Unicode characters'
            'pinentry: secure passphrase entry'
            'xsel: clipboard support (X11)'
            'xclip: clipboard support (X11)'
            'wl-clipboard: clipboard support (Wayland)')

source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('1315c525a2aebb176721e92afaddfc6b314abfe92ad195a8f2c6c06de4ba0397')
install=${pkgname}.install

build() {
  cd "${pkgname}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
