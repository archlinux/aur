pkgname=wl-screenrec-git
pkgver=r49.32f9a3f
pkgrel=3
pkgdesc="High performance hardware accelerated wlroots screen recorder"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/russelltg/wl-screenrec"
license=('APACHE')
provides=("wl-screenrec")
makedepends=('cargo' 'git')
depends=('ffmpeg')
conflicts=('wl-screenrec')
source=("$pkgname::git+https://github.com/russelltg/wl-screenrec")
sha1sums=('SKIP')

build() {
  cd "$pkgname"
  if command -v rustup > /dev/null 2>&1; then
    rustup run stable cargo build --release
  else
    cargo build --release
  fi
}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/wl-screenrec" "$pkgdir/usr/bin/wl-screenrec"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
