# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=subsync
pkgver=0.17
pkgrel=5
pkgdesc="Subtitle Speech Synchronizer"
arch=('x86_64')
url="https://subsync.online"
license=('GPL3')
depends=('ffmpeg4.4' 'pocketsphinx' 'pybind11' 'python-certifi' 'python-cryptography'
         'python-pysubs2' 'python-pyaml' 'python-requests' 'python-wxpython')
makedepends=('git' 'python-setuptools')
_commit=be5390d00ff475b6543eb0140c7e65b34317d95b
source=("git+https://github.com/sc0ty/subsync.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd "$srcdir/$pkgname"
  export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 "resources/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "resources/$pkgname.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
}
