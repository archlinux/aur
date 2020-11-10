# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# pkg: git
pkgname=hsandbox-git
pkgver=1.1.r28.gc43f92f
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
validpgpkeys=()

pkgver()
{
	cd "$srcdir/$pkgname"
	( set -o pipefail
		git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$srcdir/$pkgname/hsandbox" "$pkgdir/usr/bin/hsandbox"
}
