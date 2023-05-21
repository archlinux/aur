# Maintainer: Rafael <rafaelrc7@gmail.com>
_pkgname=zsh-git-prompt
pkgname="${_pkgname}-hs-git"
pkgver=0.5.r0.g0a6c8b6
pkgrel=2
pkgdesc="Informative git prompt for zsh (haskell support only)"
arch=('x86_64')
url="https://github.com/olivierverdier/zsh-git-prompt"
license=('MIT')
depends=('zsh' 'git')
makedepends=('stack' 'git') # stack should be a dependency. However it might be installed through ghcup
conflicts=(zsh-git-prompt zsh-git-prompt-git)
install="${pkgname}.install"
source=("git+${url}#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_pkgname}"
	stack clean
	stack setup
	stack build
}

check() {
	cd "${_pkgname}"
	stack test
}

package() {
	cd "${_pkgname}"

	install -Dm644 zshrc.sh "${pkgdir}/usr/share/zsh/plugins/${_pkgname}/zshrc.sh"
	stack install --local-bin-path "${pkgdir}/usr/share/zsh/plugins/${_pkgname}/src/.bin/"

	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

