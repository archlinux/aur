# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=verco
pkgver=5.0.0
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
sha256sums=('08fca8a2db80c1c5752b49255311d9d9ac02272b8aea8a23169a118b13cf7d71'
            '9505f57ca6c2c2be917febd1e5003ff9ca1471970d4f18b6294f9fbf06195546')

# Have to ship our own Cargo.lock until
# https://github.com/matheuslessarodrigues/verco/issues/19 is resolved.
prepare() {
  cd "$pkgname-$pkgver"
  cp ../Cargo.lock .
}

build() {
  cd "$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable \
    /usr/bin/cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
