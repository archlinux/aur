# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=sha256-animation-git
pkgver=r13.871e976
pkgrel=1
pkgdesc="Animation of the SHA-256 hash function in your terminal"
arch=('any')
url="https://github.com/in3rsha/sha256-animation"
license=('MIT')
depends=('ruby')
makedepends=('git')
provides=('sha256-animation')
conflicts=('sha256-animation')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd sha256-animation
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd sha256-animation
	install -Dm644 *.rb -t "$pkgdir/usr/lib/sha256-animation"
	install -Dm755 /dev/stdin "$pkgdir/usr/bin/sha256-animation" <<'LAUNCHER'
#!/bin/sh
exec ruby -I /usr/lib/sha256-animation /usr/lib/sha256-animation/sha256.rb "$@"
LAUNCHER

	install -Dm644 README.md "$pkgdir/usr/share/doc/sha256-animation/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
