# Maintainer: João Vitor S. Anjos <jvanjos at protonmail dot com>

pkgname=tarsila
pkgver=0.1.0
pkgrel=1
pkgdesc='Pixel art and spritesheet editor'
url='https://github.com/yds12/tarsila'
arch=('x86_64')
depends=('gcc-libs' 'glibc' 'gtk3' 'alsa-lib')
makedepends=('cargo' 'pkgconf' 'glib2' 'at-spi2-core' 'gdk-pixbuf2')
license=('MIT' 'APACHE')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('a62ded073ae3c543cac1c027b5a91bd7a3fadebf8692f166cace8665f2e216ef68b32295adb7a954164b4e3595f7328bcf01a200d76e1966e9cf94590464da05')

prepare() {
  cd ${pkgname}-${pkgver}
  cargo fetch --target $CARCH-unknown-linux-gnu
}

build() {
  cd ${pkgname}-${pkgver}
  cargo build --release --frozen
}

check() {
  cd ${pkgname}-${pkgver}
  cargo test --frozen --all-features
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
  install -Dm 644 CONTRIBUTING.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
