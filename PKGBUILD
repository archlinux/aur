# Maintainer: Max Shaughnessy <max@mshaugh.com>

pkgname=fish-nvm-git
_reponame=nvm.fish
pkgver=2.2.0.r0.g3b99c85
pkgrel=3
pkgdesc="Node.js version manager lovingly made for Fish (master branch)"
arch=('x86_64')
url="https://github.com/jorgebucaran/${_reponame}"
license=('MIT')
depends=('fish')
makedepends=('git')
install=fish-nvm-git.install
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${_reponame}::git+${url}")
sha512sums=('SKIP')

pkgver() {
         cd "${_reponame}"
	 git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${_reponame}"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" LICENSE.md
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/LICENSE" README.md
	install -Dm644 -t "${pkgdir}/usr/share/fish/vendor_completions.d/" completions/*
	install -Dm644 -t "${pkgdir}/usr/share/fish/vendor_conf.d/" conf.d/*
	install -Dm644 -t "${pkgdir}/usr/share/fish/vendor_functions.d/" functions/*
}
