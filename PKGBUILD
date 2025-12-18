# Maintainer: PandaDEV <hello@pandadev.net>
pkgname=vleer-git
pkgver=r115.g9bb4186
pkgrel=1
pkgdesc="Music, but without the subscription."
arch=('x86_64' 'aarch64')
url="https://github.com/vleerapp/vleer"
license=('AGPL-3.0')
depends=('sqlite')
makedepends=('rust' 'cargo')
provides=('vleer')
conflicts=('vleer')
source=("git+${url}")
sha256sums=('SKIP')
options=('!strip' '!lto')

pkgver() {
  cd "$srcdir/vleer"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/vleer"
  NO_STRIP=1 cargo packager --release
}

package() {
  cd "$srcdir/vleer"
  mkdir -p "$pkgdir/usr"
  find target/release/bundles -name "*.tar.gz" -exec tar -xzvf {} -C "$pkgdir/usr" --strip-components=1 \;
}
