# Maintainer: Felipe Contreras <felipe.contreras@gmail.com>

pkgname=git-completion
pkgver=1.4
pkgrel=1
pkgdesc='Git completions for Zsh and Bash'
url="https://github.com/felipec/$pkgname"
arch=('any')
license=('GPL2')
makedepends=('git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha1sums=('e969109cafff4909b4421d709e4905a2b52b8a99')

check() {
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver"
	# TODO find a better location than /usr/local/share
	DESTDIR="$pkgdir/" make \
		zshfuncdir=/usr/share/zsh/site-functions \
		completionsdir=/usr/local/share/bash-completion/completions \
		sharedir=/usr/share/git-completion \
		install
}
