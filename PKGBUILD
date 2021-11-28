# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=subsync
pkgver=0.17
pkgrel=1
pkgdesc="Subtitle Speech Synchronizer"
arch=('x86_64')
url="https://subsync.online"
license=('GPL3')
depends=('ffmpeg' 'pocketsphinx' 'pybind11' 'python-certifi' 'python-cryptography'
         'python-pysubs2' 'python-pyaml' 'python-requests' 'python-wxpython')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sc0ty/subsync/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9c0d1a6bcbdf6736517ba173b4d844412f8badd32d45e7e85edcfe542625781c')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 "resources/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "resources/$pkgname.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
}
