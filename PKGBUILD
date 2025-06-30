# Maintainer: UnicornDarkness
# Contributor: Anthony Wang <a at exozy dot me>

_pkgbase=zenmonitor3
pkgname=zenmonitor3-git
epoch=3
pkgver=r94.1e1ceec
pkgrel=1
pkgdesc="A monitoring software for AMD Zen-based CPUs, now with Zen 3 support!"
arch=('i686' 'x86_64')
url="https://github.com/detiam/zenmonitor3"
license=('MIT')
depends=('zenpower3' 'gtk3')
optdepends=('polkit: support application shortcut to launch Zen monitor as root')
makedepends=('git')
provides=('zenmonitor' 'zenmonitor-git' 'zenmonitor3')
conflicts=('zenmonitor' 'zenmonitor-git' 'zenmonitor3')
source=("git+https://github.com/detiam/zenmonitor3")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgbase"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/$_pkgbase"
	make build build-cli
}

package() {
	cd "$srcdir/$_pkgbase"
	install -dvm755 "$pkgdir/usr/share/applications" "$pkgdir/usr/share/polkit-1/actions"
	install -Dvm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	make DESTDIR="$pkgdir" PREFIX="/usr" install install-cli install-polkit
}
