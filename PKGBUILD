# Contributor: orhun <orhunparmaksiz@gmail.com>
# Contributor: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=wtftw-git
pkgver=r347.14f3d1e
pkgrel=2
pkgdesc='Window Tiling For The Win. A tiling window manager written in Rust (git)'
arch=('i686' 'x86_64')
url="https://github.com/Kintaro/wtftw"
license=('BSD')
depends=('xorg-xmessage' 'libxinerama' 'gcc-libs')
makedepends=('rust' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}"
        "$pkgname-$pkgver-LICENSE::$url/raw/master/LICENSE")
sha256sums=('SKIP'
            'd2fff178c328ba155cf3eddcdf7533c9aca0b415a4f748a251ea1c32656700a1')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  cargo build --release --locked
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "target/release/${pkgname%-git}" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 config/config.rs -t "$pkgdir/usr/share/${pkgname%-git}"
  install -Dm 644 "../$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
