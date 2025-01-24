# Maintainter: Jerome M. Berger <jeberger@free.fr>
pkgname=pacmerge
pkgver=0.2.1
pkgrel=1
pkgdesc="A semi-automatic merge tool for pacnew files."
arch=('x86_64' 'armv7h')
url="https://heptapod.host/jmb/pacmerge"
license=('GPL3')
depends=(expac diffutils)
makedepends=(cargo mercurial)
source=("$pkgname::hg+https://heptapod.host/jmb/pacmerge#tag=v${pkgver}")
md5sums=(SKIP)
install=pacmerge.install

build() {
    cd "$pkgname"

    cargo build --release --locked
}

package() {
    cd "$pkgname"

    install -Dm755 "target/release/pacmerge" "$pkgdir/usr/bin/pacmerge"
    install -Dm644 "pacmerge.hook" "$pkgdir/usr/share/libalpm/hooks/pacmerge.hook"
}
