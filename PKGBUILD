# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Contributor: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# https://github.com/orhun/pkgbuilds

pkgname=wtftw-git
pkgver=r347.14f3d1e
pkgrel=1
epoch=1
pkgdesc='Window Tiling For The Win. A tiling window manager written in Rust (git)'
arch=('i686' 'x86_64')
url="https://github.com/Kintaro/wtftw"
license=('custom')
depends=('xorg-xmessage' 'libxinerama')
makedepends=('cargo' 'git')
install=wtftw.install
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}"
        "${pkgname%-git}-$pkgver-LICENSE::$url/raw/master/LICENSE")
sha256sums=('SKIP'
            'd2fff178c328ba155cf3eddcdf7533c9aca0b415a4f748a251ea1c32656700a1')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  cargo build --release --all-features
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "target/release/${pkgname%-git}" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-git}"
  install -Dm 644 config/config.rs -t "$pkgdir/usr/share/${pkgname%-git}"
  install -Dm 644 "../${pkgname%-git}-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
