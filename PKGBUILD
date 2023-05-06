# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgname=rtcqs
pkgdesc='Scanner for potential real-time bottlenecks'
pkgver=0.5.3
pkgrel=3
arch=(any)
url='https://codeberg.org/rtcqs/rtcqs'
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('python-pysimplegui: for rtcqs_gui')
groups=(pro-audio)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
        "https://codeberg.org/$pkgname/$pkgname/raw/commit/cc129306/$pkgname.desktop")
sha256sums=('34baf6eeb87660c8cd975221001e10c8aca73e2bf0474ca8de1afd63555f3fdd'
            '6540a30fffff5db0f005830c9c090e95b0312e7efec8dd5ea25d995781703da3')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -vDm644 ../$pkgname.desktop -t "$pkgdir"/usr/share/applications
}
