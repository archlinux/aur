# Maintainer: Giuseppe <giuscri@gmail.com>
pkgname=bash-preexec-git
pkgver=0.3.3.r0.gc4537b4
pkgrel=3
pkgdesc="⚡ preexec and precmd functions for Bash just like Zsh."
arch=('x86_64')
url="https://github.com/rcaloras/bash-preexec"
license=('MIT')
makedepends=('git' 'bash-bats')
source=("$pkgname::git+https://github.com/rcaloras/bash-preexec.git")
install=$pkgname.install
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
	cd "$srcdir/$pkgname/test"
	bats .
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m0755 "$srcdir/$pkgname/bash-preexec.sh" "$pkgdir/usr/share/bash-preexec/bash-preexec.sh"
	install -D -m0644 "$srcdir/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/bash-preexec/LICENSE.md"
}

# vim: set noet ts=4:
