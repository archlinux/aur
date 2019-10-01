# Maintainer: Max Jöhnk <maxjoehnk@gmail.com>
pkgname=colorex-git
pkgver=r8.d06d766
pkgrel=1
pkgdesc='colorex (colorize + regular expression) colorize input lines that match given patterns.'
arch=('x86_64')
url="https://github.com/aereal/colorex"
license=('unknown')
groups=()
depends=('glibc')
makedepends=('git' 'go-pie')
provides=('colorex')
conflicts=()
replaces=()
backup=()
options=()
install=
source=("${pkgname}::git+${url}")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-VCS}"
    go build \
        -o colorex \
        -trimpath \
        -ldflags "-extldflags ${LDFLAGS}"
}

package() {
    install -D "$srcdir/${pkgname%-VCS}/colorex" "$pkgdir/usr/bin/colorex"
}
