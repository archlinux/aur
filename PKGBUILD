# Maintainer: shadwoash8 <shadowash8 at protonmail dot com>

pkgname=ashrwm-git
_pkgname=ashrwm

pkgver=20260409.r1
pkgrel=1
pkgdesc="a minimal yet functional river window manager with tiling/grid layout and more!"
arch=('x86_64')
url="https://github.com/shadowash8/ashrwm"
license=('MIT')
depends=('river' 'janet')
makedepends=('zig' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')
options=('!debug')

pkgver() {
  cd "${srcdir}"
  printf "%s.r%s" \
    "$(git log -1 --format="%cd" --date=short | sed 's/\-//g')" \
    "$(git rev-list --count HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}" || exit 1
    zig build -Doptimize=ReleaseSafe
}

package() {
    cd "${srcdir}/${pkgname}" || exit 1
	
    install -Dm755 "zig-out/bin/ashrwm" "${pkgdir}/usr/bin/ashrwm"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
