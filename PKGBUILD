# Maintainer: Rayr https://rayr.ml/LinkInBio/
pkgname=evillimiter-patched
pkgver=1.6.0
pkgrel=2
pkgdesc="A patched version of evillimiter tool, which adds support for arrow keys running previous command and suppressing disruptive warnings."
arch=('any')
url="https://github.com/Rayrsn/evillimiter"
prgname=evillimiter
license=('MIT')
depends=('python-colorama' 'python-netaddr' 'python-netifaces' 'python-tqdm'
         'python-scapy' 'python-terminaltables')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b2e097bdc64ec93e6d064c35fd1f5d052c6825f91ac2393877e0619273bc5665')

build() {
  cd "$prgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$prgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$prgname"

  # Fix LIBC issue
  ln -sf /usr/lib/libc.a "$pkgdir/usr/lib/liblibc.a"
}
