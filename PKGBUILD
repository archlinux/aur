# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgname=rtcqs
pkgdesc='Scanner for potential real-time bottlenecks'
pkgver=0.6.0
pkgrel=1
arch=(any)
url='https://codeberg.org/rtcqs/rtcqs'
license=(MIT)
depends=(hicolor-icon-theme python)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('python-pysimplegui: for rtcqs_gui')
groups=(pro-audio)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
        "https://codeberg.org/$pkgname/$pkgname/raw/commit/773460b7d8/$pkgname.desktop"
        "https://codeberg.org/$pkgname/$pkgname/raw/commit/773460b7d8/${pkgname}_logo.svg")
sha256sums=('8b42b7d7b1221fa7c58b4b620a69f57008af8f81c97da70a7e46e52ff17951a8'
            '6540a30fffff5db0f005830c9c090e95b0312e7efec8dd5ea25d995781703da3'
            'e2cc1e4cbedc4d24f1804812017190742f6df2f9eba1fa5f31d93595a91f2cfc')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -vDm644 "$srcdir"/$pkgname.desktop -t "$pkgdir"/usr/share/applications
  install -vDm644 "$srcdir"/${pkgname}_logo.svg \
    "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$pkgname.svg
}
