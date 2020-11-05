_pkgname=waylock
pkgname=${_pkgname}-git
pkgver=0.3.3.105.g2391ef6
pkgrel=1
arch=('x86_64')
url="https://github.com/ifreund/waylock"
pkgdesc="Waylock is a simple screenlocker for wayland compositors."
license=('MIT')
depends=('pam')
makedepends=('rust')
provides=('waylock')
conflicts=('waylock')
source=("git+https://github.com/ifreund/waylock.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  cargo build --release --locked --all-features --target-dir=target
}

check(){
  cd "$_pkgname"
  cargo test --release --locked --target-dir=target
}

package() {
  cd "$_pkgname"
  install -Dm 755 target/release/${_pkgname} -t "${pkgdir}/usr/bin"
}
