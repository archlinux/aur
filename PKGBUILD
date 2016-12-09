# Maintainer: Bastien Traverse <firstname at lastname dot email>

pkgname=blacklist-check
pkgver=r26.5b8705e
pkgrel=1
pkgdesc="Bash script to check blacklisting for domains and IP addresses"
arch=('any')
url="https://github.com/adionditsak/blacklist-check-unix-linux-utility"
license=('MIT')
depends=('bash')
makedepends=('git')
source=("$pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
# Support both current absence of tags and possible future addition
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
    cd "$srcdir/$pkgname/"
    install -Dm755 bl "$pkgdir/usr/bin/bl"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
