_pkgname=waylock
pkgname=${_pkgname}-git
pkgver=0.3.3.r2.gd4f4308
pkgrel=1
arch=('x86_64')
url="https://github.com/ifreund/waylock"
pkgdesc="Waylock is a simple screenlocker for wayland compositors."
license=('MIT')
depends=('pam')
makedepends=('git' 'rust')
provides=('waylock')
conflicts=('waylock')
source=("git+https://github.com/ifreund/waylock.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
    install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
    install -vDm 644 {README.md,waylock.toml} -t "${pkgdir}/usr/share/doc/${_pkgname}"
}
