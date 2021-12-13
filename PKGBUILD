# Maintainer: goetzc

pkgname=pytify
pkgver=3.6.3
pkgrel=3
pkgdesc='A Python CLI application for controlling Spotify.'
arch=(any)
url='https://github.com/bjarneo/Pytify'
license=(MIT)
makedepends=(python)
depends=(python-spotipy python-dbus python-prompt_toolkit)
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://github.com/bjarneo/${pkgname}/archive/v${pkgver}.tar.gz)

prepare() {
  cd "Pytify-${pkgver}"
  sed \
    -e 's/spotipy ~= 2.3.8/spotipy >= 2.4.4/' \
    -e 's/prompt-toolkit ~= 2.0.9/prompt-toolkit >= 3.0/' \
    -i requirements.txt
}

build() {
  cd "Pytify-${pkgver}"
  python setup.py build
}

package() {
  cd "Pytify-${pkgver}"
  python setup.py install --root="$pkgdir/" --skip-build --optimize=1
}

sha256sums=('43d6b596c64c04e5a99a2f79510422f2dcb8d8f1c52f52a42a4b4b1035a69cd5')
