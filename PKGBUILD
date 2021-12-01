pkgname='helvum-git'
_pkgname='helvum'
pkgver=0.3.2.115.gc1ec56e
pkgrel=1
pkgdesc="A GTK patchbay for pipewire."
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/ryuukyu/helvum"
license=('GPL3')
depends=('pipewire' 'gtk4')
makedepends=('rust' 'cargo' 'git')
provides=('helvum')
conflicts=('helvum')
source=("$_pkgname::git+https://gitlab.freedesktop.org/ryuukyu/helvum.git")
sha384sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    echo "$(grep '^version =' Cargo.toml | head -n1 | awk -F '"' '{print $2}').$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
    cd $_pkgname
    RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
 }

package() {
    cd "$srcdir/$_pkgname"
    install -Dm 755 target/release/${_pkgname} -t "${pkgdir}/usr/bin"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
