# Maintainer: Rayr https://rayr.ml/LinkInBio/
pkgname=evillimiter-patched
pkgver=1.6.0
pkgrel=1
pkgdesc="A patched version of evillimiter tool, which adds support for arrow keys running previous command and suppressing disruptive warnings."
arch=('any')
url="https://github.com/Rayrsn/evillimiter"
license=('MIT')
depends=('python-colorama' 'python-netaddr' 'python-netifaces' 'python-tqdm'
         'python-scapy' 'python-terminaltables')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d325e33104c1b09538391867a8f4d467ac815910c630ceb5bc6b836771564b5e')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  # Fix LIBC issue
  ln -sf /usr/lib/libc.a "$pkgdir/usr/lib/liblibc.a"
}
