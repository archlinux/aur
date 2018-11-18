# Maintainer: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=wtftw-git
pkgver=1.2.r57.gebf5f9f
pkgrel=1
epoch=1
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
sha256sums=('SKIP'
            'd2fff178c328ba155cf3eddcdf7533c9aca0b415a4f748a251ea1c32656700a1')

pkgver() {
  cd wtftw
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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

