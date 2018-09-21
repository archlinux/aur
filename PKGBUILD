# Maintainer: goetzc

pkgname=pytify
pkgver=3.5.1
pkgrel=1
pkgdesc='A Python CLI application for controlling Spotify.'
arch=(any)
url='https://github.com/bjarneo/Pytify'
license=(MIT)
makedepends=(python)
depends=(python-spotipy python-dbus python-prompt_toolkit)
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://github.com/bjarneo/${pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('d94046956e9799fc34970297e7f9f020')

prepare() {
  cd "Pytify-${pkgver}"
  sed -i \
    -e 's/prompt-toolkit==1.0/prompt-toolkit>=1.0/' \
    -e 's/requests ~= 2.4.3/requests>=2.4.3/' \
    -e 's/spotipy~=2.3.8/spotipy>=2.4.4/' \
    setup.py
}

build() {
  cd "Pytify-${pkgver}"
  python setup.py build
}

package() {
  cd "Pytify-${pkgver}"
  python setup.py install --root="$pkgdir/" --skip-build --optimize=1
}
