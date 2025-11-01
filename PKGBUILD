# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>

pkgname=zune-git
pkgver=v0.5.1
pkgrel=2
pkgdesc='A Luau runtime, similar to Lune, Node, or Bun.'
url='https://github.com/Scythe-Technology/zune'
license=('MIT')
depends=('glibc')
makedepends=('zig' 'git')
provides=('zune')
conflicts=('zune' 'zune-bin')
arch=('x86_64' 'aarch64')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "zune"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "zune"
    zig build --fetch
}

build() {
    cd "zune"
    zig build install --prefix 'out' -Doptimize=ReleaseSafe
}

package() {
    cd "zune"
    install -Dm0755 "out/bin/zune" "$pkgdir/usr/bin/zune"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
