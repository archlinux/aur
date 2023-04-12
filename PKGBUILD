# Maintainer: João Vitor S. Anjos <jvanjos at protonmail dot com>

_pkgname=tarsila
pkgname=${_pkgname}-git
pkgver=0.1.0.r43.g9212f28
pkgrel=2
pkgdesc='Pixel art and spritesheet editor'
url='https://github.com/yds12/tarsila'
arch=('x86_64')
depends=('gcc-libs' 'glibc' 'gtk3' 'alsa-lib')
makedepends=('cargo' 'pkgconf' 'glib2' 'at-spi2-core' 'gdk-pixbuf2' 'git')
license=('MIT' 'APACHE')
source=("${_pkgname}::git+${url}.git")
conflicts=(${_pkgname})
provides=(${_pkgname})
sha512sums=('SKIP')

prepare() {
  cd ${_pkgname}
  cargo fetch --target $CARCH-unknown-linux-gnu
}

build() {
  cd ${_pkgname}
  cargo build --release --frozen
}

check() {
  cd ${_pkgname}
  cargo test --frozen --all-features
}

package() {
  cd ${_pkgname}
  install -Dm 755 target/release/${_pkgname} -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE* -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
}

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

# vim: ts=2 sw=2 et:
