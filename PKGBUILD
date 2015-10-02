# Maintainer: Sebastian Neef <aur AT gehaxelt DOT IN>
pkgname=poodlescanner-git
pkgver=r2.13bc21d
pkgrel=1
pkgdesc="Python SSL POODLE Vulnerability Scanner Python tool to scan a netblock for SSLv3 enabled servers."
arch=('any')
url="https://github.com/internetwache/POODLEScanner"
license=('unknown')
depends=('python3' 'python-ipy')
makedepends=('git' 'bash')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=('poodlescanner-git::git+https://github.com/internetwache/POODLEScanner.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	mv POODLEScanner.py "$pkgdir/usr/bin/poodlescanner"
}
