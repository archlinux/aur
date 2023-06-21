pkgname=sway-vdctl-git
_pkgname=sway-vdctl
_pkgver=0.0.1
pkgver=0.0.1.r1.4a43da8
pkgrel=1
pkgdesc="A command line utility for creating and managing virtual (headless) outputs in sway & starting a vnc server for them."
url="https://github.com/odincat/sway-vdctl"
makedepends=('cargo')
arch=('i686' 'x86_64')
source=("git+https://github.com/odincat/sway-vdctl.git")
sha512sums=('SKIP')
provides=('sway-vdctl')
conflicts=('sway-vdctl')
depends=('wayvnc')
optdepends=('vinagre: vnc client for the GNOME desktop')

pkgver() {
    cd "$_pkgname"
    printf "$_pkgver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    cargo build --release --target-dir "./target"
}

package() {
    cd "$_pkgname"
    install -Dm755 "target/release/main" "$pkgdir/usr/bin/$_pkgname"
}
