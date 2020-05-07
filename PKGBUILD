# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>

pkgname=python-cutadapt
pkgver=2.10
pkgrel=2
pkgdesc='Trim adapters from high-throughput sequencing reads'
arch=('x86_64' 'i686')
url="http://cutadapt.readthedocs.io/en/v$pkgver/"
license=('MIT')
depends=('python')
makedepends=('cython' 'git' 'python-pip' 'python-wheel')
provides=('cutadapt')
conflicts=('python2-cutadapt')
source=("git+https://github.com/marcelm/cutadapt.git#tag=v$pkgver"
	"help_format.patch::https://github.com/marcelm/cutadapt/commit/30afda41888908b3bdda8b4369c0321ad77e75f3.patch")
sha256sums=('SKIP'
            '87b84e923347a2df27f57a8d1fb543d5f66d17ad5f6a6687584773957c98f410')

prepare() {
  cd "$srcdir/cutadapt"
  git apply --stat "$srcdir"/*.patch
}

build() {
  cd "$srcdir/cutadapt"

  python setup.py build
}

package() {
  cd "$srcdir/cutadapt"

  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
