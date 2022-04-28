# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=emacs-dracula-theme
pkgname=$_pkgname-git
pkgver=1.7.0.r74.ge725c9e
pkgrel=1
pkgdesc="Dark theme for Emacs"
arch=('any')
url="https://draculatheme.com/emacs"
license=('MIT')
groups=('dracula-theme')
makedepends=('emacs-nox' 'git')
optdepends=('emacs>=24.3')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/dracula/emacs.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir/$(emacs -Q --batch --eval='(princ data-directory)')"/themes dracula-theme.el
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
