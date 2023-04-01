# Maintainer: Felipe Contreras <felipe.contreras@gmail.com>

pkgname=git-completion
pkgver=2.0
pkgrel=1
pkgdesc='Git completions for zsh and bash'
url="https://github.com/felipec/$pkgname"
arch=('any')
license=('GPL2')
makedepends=('git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha1sums=('0f6c53245d10058d4eee0cec918adb89f42bba31')

check() {
	cd "$pkgname-$pkgver" || exit 1
	make test
}

package() {
	cd "$pkgname-$pkgver" || exit 1
	# TODO find a better location than /usr/local/share
	DESTDIR="$pkgdir/" make \
		zshfuncdir=/usr/share/zsh/site-functions \
		completionsdir=/usr/local/share/bash-completion/completions \
		sharedir=/usr/share/git-completion \
		install
}
