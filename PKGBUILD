# Maintainer: Ilaï Deutel

pkgname=kibi-git
pkgver=0.1.2.r22.g442032d
pkgrel=1
pkgdesc="A tiny text editor, written in Rust"
url="https://github.com/ilai-deutel/kibi"
makedepends=('cargo')
depends=('gcc-libs')
conflicts=('kibi')
provides=('kibi')
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('MIT' 'APACHE')
backup=('etc/kibi/config.ini' etc/kibi/syntax.d/{bash,gitignore,ini,python,rust,toml}.ini)
source=("$pkgname::git+https://github.com/ilai-deutel/kibi.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  cargo build --release --locked --all-features
}

package() {
  cd "$pkgname"

  install -Dm755 "target/release/kibi" -t "${pkgdir}/usr/bin"

  install -Dm755 -d "${pkgdir}/etc/kibi"
  cp -dr --no-preserve=ownership "config_example" -T "${pkgdir}/etc/kibi"

  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
