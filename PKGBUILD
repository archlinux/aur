# Maintainer: Rayr https://rayr.ml/LinkInBio/
pkgname=evillimiter-patched
pkgver=1.6.1
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
sha256sums=('79e98a5b75b42cd349506c415430bc7dfb7d35a8a754a1c6852d9c47f6553739')

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
