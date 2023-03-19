# Maintainer Tait Hoyem <tait+odilia_aur@tait.tech>

pkgname=odilia
pkgver=0.1.0
pkgrel=1
pkgdesc="Building a better screen reader for the Linux desktop, one step at a time. "
url="https://odilia.app/"
license=('GPL3')
arch=('x86_64' 'aarch64')
depends=(
  clang # required by speech-dispatcher-dev
  speech-dispatcher # required by above, as well as -rs crate
  cargo # for compiling odilia
  at-spi2-core # for interaction of Odilia with the atspi service
  at-spi2-atk # for interaction of Odilia with GTK applications
)
provides=( odilia )

prepare() {
    rm -rf $srcdir/odilia || echo "No git found. Cloning..."
    git clone https://github.com/odilia-app/odilia
}

build() {
    cd $srcdir/odilia
    cargo build --release
}

package() {
    mkdir -p $pkgdir/usr/local/bin/
    install -m 755 $srcdir/odilia/target/release/odilia $pkgdir/usr/local/bin/odilia
}

#vim: syntax=sh

