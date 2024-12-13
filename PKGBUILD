# Maintainer: UnicornDarkness
# Contributor: Anthony Wang <a at exozy dot me>

_pkgbase=zenmonitor3
pkgname=zenmonitor3-git
epoch=2
pkgver=r90.a09f0b2
pkgrel=1
pkgdesc="Zenmonitor3 is monitoring software for AMD Zen-based CPUs, now with Zen 3 support!"
arch=('i686' 'x86_64')
url="https://git.unnamed.website/zenmonitor3"
license=('GPL')
depends=('zenpower3' 'gtk3')
optdepends=('polkit: support application shortcut to launch Zen monitor as root')
makedepends=('git')
provides=('zenmonitor')
source=("git+https://git.unnamed.website/zenmonitor3")
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
	make DESTDIR="$pkgdir" PREFIX="/usr" install install-cli install-polkit
}
