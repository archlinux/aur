# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>

pkgname=cp2cp-git
_gitname=libshvproto-rs
pkgver=r337.f2dc126
pkgrel=1
pkgdesc='ChainPack to Cpon and back utility'
url='https://github.com/silicon-heaven/libshvproto-rs'
license=('MIT')
makedepends=('cargo' 'git')
depends=()
provides=('cp2cp')
conflicts=('cp2cp')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=('git+https://github.com/silicon-heaven/libshvproto-rs')
b2sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
	cd "$srcdir/$_gitname"
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_gitname"
    cargo build --features cp2cp --release
}

check() {
	cd "$srcdir/$_gitname"
    cargo test
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$_gitname/target/release/cp2cp"
    install -Dm644 "$srcdir/$_gitname/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
