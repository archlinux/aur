# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=terpod
pkgver=0.3.0
pkgrel=1
pkgdesc="A terminal podcast manager"
url="https://github.com/samhh/terpod/"
arch=('x86_64')
license=('AGPL')
source=("$pkgname-$pkgver.tar.gz::https://github.com/samhh/terpod/archive/$pkgver.tar.gz")
sha256sums=('7826362ad67487fc38b6a445f679ee97ef3d6b458a9a873038faa783036e73fd')

build() {
	echo "Please note that the \"cabal\" command is required for building. A makedepends has yet to be set pending a better understanding of how this dependency should be handled."
	cd "$pkgname-$pkgver"
	cabal install --install-method=copy --installdir=dist
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "dist/$pkgname" "$pkgdir/usr/bin/$pkgname"
	_install_completion_script bash "bash-completion/completions/$pkgname"
	_install_completion_script zsh "zsh/site-functions/_$pkgname"
	_install_completion_script fish "fish/vendor_completions.d/$pkgname.fish"
}

_install_completion_script() {
	install -Dm644 <("$pkgdir/usr/bin/$pkgname" --$1-completion-script "/usr/bin/$pkgname") "$pkgdir/usr/share/$2"
}

