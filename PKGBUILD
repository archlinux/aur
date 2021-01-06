# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# pkg: git
pkgname=hsandbox-git
pkgver=1.1.r29.gbf81769
pkgrel=1
pkgdesc="The Hacking Sandbox"
arch=('any')
url="http://labix.org/hsandbox"
license=('unknown')
depends=('python' 'python-pyinotify')
makedepends=('git')
provides=('hsandbox')
source=("$pkgname::git+https://github.com/niemeyer/hsandbox")
sha256sums=('SKIP')

pkgver()
{
	cd "$srcdir/$pkgname"
	( set -o pipefail
		git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build()
{
	2to3 -w -n "$srcdir/$pkgname/hsandbox" > /dev/null
}

package() {
	install -Dm755 "$srcdir/$pkgname/hsandbox" "$pkgdir/usr/bin/hsandbox"
}
