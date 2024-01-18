# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributer: HelloImWar <helloimwar at proton dot me>
# Contributer: Yamada Hayao <hayao@fascode.net>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: slact

pkgname=tlpui
pkgver=1.7.0
pkgrel=1
epoch=1
pkgdesc="A GTK user interface for TLP written in Python"
arch=('any')
url="https://github.com/d4nj1/TLPUI"
license=('GPL2')
depends=('tlp' 'python-gobject' 'hicolor-icon-theme' 'python-yaml' 'gtk3' 'python-toml')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-poetry')
source=("https://github.com/d4nj1/TLPUI/archive/refs/tags/$pkgname-$pkgver.tar.gz")
sha256sums=('d4fd41053e28ffff2aaffa14c47d2c41a6a2f4e3c425d9e26357d164f27717ca')

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
