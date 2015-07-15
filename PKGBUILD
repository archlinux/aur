# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=wtftw-git
pkgver=274.60cb3b4
pkgrel=1
pkgdesc='Window Tiling For The Win. A tiling window manager written in Rust'
arch=('i686' 'x86_64')
url="https://github.com/Kintaro/wtftw"
license=('custom')
depends=('rust'
         'xorg-xmessage')
makedepends=('cargo' 'git')
provides=('wtftw')
conflicts=('wtftw')
install=wtftw.install
source=('git+https://github.com/Kintaro/wtftw.git'
        'LICENSE')
md5sums=('SKIP'
         'c25c61c4abc29d3b8a4c973f7c3ca0b9')

pkgver() {
  cd wtftw
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd wtftw
  cargo build --release
}

package() {
  cd wtftw
  install -Dm755 target/release/wtftw \
    "${pkgdir}"/usr/bin/wtftw

  install -D config/config.rs \
    "${pkgdir}"/usr/share/wtftw/config.rs

  install -D LICENSE \
    "${pkgdir}"/usr/share/licenses/wtftw/LICENSE
}
