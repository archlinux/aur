# Maintainer: RAMA <143774106+Nomadcxx@users.noreply.github.com>
pkgname=sysclet-git
pkgver=r27.ga59c415
pkgrel=1
pkgdesc="Generate ANSI text headers from TheDraw TDF fonts"
arch=('x86_64' 'aarch64')
url="https://github.com/Nomadcxx/sysclet"
# The GPL applies to sysclet code; bundled TDF fonts have separate terms.
license=('GPL-3.0-only' 'custom')
makedepends=('git' 'go')
optdepends=('wl-clipboard: copy snippets from Wayland sessions'
            'xclip: copy snippets from X11 sessions'
            'xsel: copy snippets from X11 sessions')
provides=('sysclet')
conflicts=('sysclet')
options=('!debug')
source=('sysclet::git+https://github.com/Nomadcxx/sysclet.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/sysclet"
	printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/sysclet"
	export CGO_ENABLED=0
	go build -mod=readonly -trimpath -ldflags='-s -w' -o sysclet .
}

package() {
	cd "$srcdir/sysclet"
	install -Dm755 sysclet "$pkgdir/usr/bin/sysclet"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 THIRD-PARTY-NOTICES.md "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.md"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 THIRD-PARTY-NOTICES.md "$pkgdir/usr/share/doc/$pkgname/THIRD-PARTY-NOTICES.md"
}
