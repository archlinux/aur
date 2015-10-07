# Maintainer: Sebastian Neef <aur AT gehaxelt DOT IN>
pkgbase=axfrscanner-git
pkgname=axfrscanner-git
pkgver=r8.3c78829
pkgrel=1
pkgdesc="A tool to test if the nameservers of a domain are misconfigured and allow AXFR (dns zone transfers) to anyone."
arch=('any')
url="https://github.com/internetwache/Python-AXFR-Test"
license=('MIT')
depends=('python3' 'python-dnspython')
makedepends=('git' 'bash')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}::git+https://github.com/internetwache/Python-AXFR-Test.git")
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
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	chmod +x axfr-test.py
	mv axfr-test.py "$pkgdir/usr/bin/axfrscanner"
	
	mv "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/"
}
