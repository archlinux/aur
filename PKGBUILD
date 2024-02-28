# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributer: HelloImWar <helloimwar at proton dot me>
# Contributer: Yamada Hayao <hayao@fascode.net>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: slact

pkgname=tlpui
pkgver=1.6.4
pkgrel=2
epoch=2
pkgdesc="A GTK user interface for TLP written in Python"
arch=('any')
url="https://github.com/d4nj1/TLPUI"
license=('GPL2')
depends=('tlp' 'python-gobject' 'hicolor-icon-theme' 'python-yaml' 'gtk3' 'python-toml')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-poetry')
source=("https://github.com/d4nj1/TLPUI/archive/refs/tags/$pkgname-$pkgver.tar.gz")
sha256sums=('6ad6fb4bee0a18b1c113f5eb3fb10d09c4249a8df323927af24d54e8d0e1325f')

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

  install -Dm644 "$pkgname.desktop" \
  "$pkgdir/usr/share/applications/$pkgname.desktop"
}
