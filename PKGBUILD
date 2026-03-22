pkgname=anyrun-qalculate-git
_pkgname=anyrun-qalculate
pkgver=r0.0000000
pkgrel=1
pkgdesc="Anyrun plugin providing a qalculate-powered calculator via libqalculate C++ FFI"
arch=('x86_64')
url="https://github.com/maxeonyx/anyrun-qalculate"
license=('MIT')
options=('!lto')
depends=('anyrun' 'libqalculate')
makedepends=('rust' 'cargo' 'gcc' 'pkgconf' 'git')
provides=('anyrun-qalculate')
conflicts=('anyrun-qalculate')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 target/release/libanyrun_qalculate.so "$pkgdir/usr/lib/anyrun/libanyrun_qalculate.so"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
