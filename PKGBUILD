# Maintainer: Ilaï Deutel

pkgname=kibi
pkgver=0.1.2
pkgrel=2
pkgdesc="A tiny text editor, written in Rust"
url="https://github.com/ilai-deutel/${pkgname}"
makedepends=('cargo')
depends=('gcc-libs')
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('MIT' 'APACHE')
backup=('etc/kibi/config.ini' etc/kibi/syntax.d/{bash,gitignore,ini,python,rust,toml}.ini)
source=("https://github.com/ilai-deutel/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b44d9a8ff27b225a4ab05a87fd4b7355dc2d768431c58b7c767c08d993291496')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked --all-features
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"

  install -Dm755 -d "${pkgdir}/etc/kibi"
  cp -dr --no-preserve=ownership "config_example" -T "${pkgdir}/etc/kibi"

  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
