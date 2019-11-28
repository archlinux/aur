# Maintainer: Rohan Verma <hello@rohanverma.net>
pkgname=simplelock
pkgver=r7.85ceea7
pkgrel=1
pkgdesc="Fast and simple wrapper over i3lock with multiple modes. Supports xkcd and unsplash"
arch=('any')
url="https://github.com/rhnvrm/simplelock"
license=('MIT')
groups=()
depends=('bash' 'i3lock')
makedepends=('git')
checkdepends=()
optdepends=()
provides=('simplelock')
conflicts=()
replaces=()
backup=()
options=()
source=("simplelock-git::git+https://github.com/rhnvrm/simplelock.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname-git"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	set -e
	cd $srcdir/$pkgname-git
	mkdir -p ~/.config/simplelock
	cp lock.png ~/.config/simplelock/
	cp lockscreen.png ~/.config/simplelock/
	install -D -m755 -t "$pkgdir/usr/bin" "simplelock"
}
