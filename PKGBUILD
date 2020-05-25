# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=verco
pkgver=5.2.0
pkgrel=1
pkgdesc='A simple Git/Hg tui client focused on keyboard shortcuts.'
arch=('i686' 'x86_64')
url="https://github.com/matheuslessarodrigues/verco"
license=('MIT')
depends=()
optdepends=('git: support for git repositories'
            'mercurial: support for mercurial repositories')
conflicts=('verco-git')
makedepends=('cargo')
source=("$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        Cargo.lock)
sha256sums=('51d1891bd8a6e24f159472788ede0d59566941fd4b9689746a3c12378e0adf8b'
            '422a4b25d9571e25274b37ba50378957aec31a872cd0ac7c6afc1248c991bd8e')

# Have to ship our own Cargo.lock until a release with the Cargo.lock is
# published. The lock file included here is the one from this commit, which
# was made after the 5.2.0 release.
prepare() {
  cd "$pkgname-$pkgver"
  cp ../Cargo.lock .
}

build() {
  cd "$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable \
    cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
