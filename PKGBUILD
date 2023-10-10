# Maintainer: 
# Contributer: HelloImWar <helloimwar at proton dot me>
# Contributer: Yamada Hayao <hayao@fascode.net>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: slact

pkgname=tlpui
pkgver=1.6.0
pkgrel=2
epoch=1
pkgdesc="A GTK user interface for TLP written in Python"
arch=('any')
url="https://github.com/d4nj1/TLPUI"
license=('GPL2')
depends=('tlp' 'python-gobject')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://github.com/d4nj1/TLPUI/archive/refs/tags/$pkgname-$pkgver.tar.gz")
sha256sums=('f1b2cd69cb25f59ce973ee8411e51ded45032d289ec8f6f62ccbb45919d16b86')

build() {
  cd "TLPUI-$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "TLPUI-$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  for i in 16 32 48 64 128 96 128 256; do
    install -Dm644 "$pkgname/icons/themeable/hicolor/${i}x${i}/apps/$pkgname.png" -t \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/"
  done

  install -Dm644 "$pkgname/icons/themeable/hicolor/scalable/apps/$pkgname.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
}
