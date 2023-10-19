# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributer: HelloImWar <helloimwar at proton dot me>
# Contributer: Yamada Hayao <hayao@fascode.net>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: slact

pkgname=tlpui
pkgver=1.6.1
pkgrel=1
epoch=1
pkgdesc="A GTK user interface for TLP written in Python"
arch=('any')
url="https://github.com/d4nj1/TLPUI"
license=('GPL2')
depends=('tlp' 'python-gobject')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://github.com/d4nj1/TLPUI/archive/refs/tags/$pkgname-$pkgver.tar.gz")
sha256sums=('7889e08b52d93a3a96692b5fe0564e3d6da0a721072a673c0981fd3670c0d2fe')

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
