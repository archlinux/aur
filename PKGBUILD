pkgname=wl-screenrec
pkgver=0.1.1
pkgrel=1
pkgdesc="High performance hardware accelerated wlroots screen recorder"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/russelltg/wl-screenrec"
license=('APACHE')
provides=("wl-screenrec")
makedepends=('cargo' 'git' 'clang' 'rust' 'cargo')
depends=('ffmpeg' 'libva-driver')
conflicts=('wl-screenrec-git')
source=("https://github.com/russelltg/wl-screenrec/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3a486a3970e308342ea0204efc53250d37ea6082ac63c38be8a89063809f7952')

build() {
  cd "$pkgname-$pkgver"
  if command -v rustup > /dev/null 2>&1; then
    rustup run stable cargo build --release
  else
    cargo build --release
  fi
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/wl-screenrec" "$pkgdir/usr/bin/wl-screenrec"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
