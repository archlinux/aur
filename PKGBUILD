# Maintainer: yuioto <yuiotochan@outlook.com>

pkgname=fav-bin
_pkgname=fav
pkgver=0.2.27
pkgrel=1
pkgdesc='Back up your favorite bilibili resources with CLI'
arch=('x86_64')
url="https://github.com/kingwingfly/${_pkgname}"
# license=('LicenseRef-MIT')
license=('custom:MIT')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
OPTIONS=(!debug)
source=("${_pkgname}-${pkgver}.tar.gz::$url/releases/download/v$pkgver/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
	"https://github.com/kingwingfly/fav/raw/v${pkgver}/LICENSE")
sha256sums=('ad06a0c4e3ae7c22d0a3ba2a0a0c5b9f635f03ad2560c999c8c78ea28bf54d85'
            '54e2d4c99f8d0eacb6dd9cae4c1bddce86fe7926d29cdb0ceded4d3797df0d65')

package() {
	install -Dm755 ${_pkgname} "$pkgdir"/usr/bin/${_pkgname}

	# completions
	./${_pkgname} completion bash > ${_pkgname}.bash
	./${_pkgname} completion fish > ${_pkgname}.fish
	./${_pkgname} completion zsh > _${_pkgname}
	install -Dm644 ${_pkgname}.bash "$pkgdir"/usr/share/bash-completion/completions/${_pkgname}
	install -Dm644 ${_pkgname}.fish "$pkgdir"/usr/share/fish/vendor_completions.d/${_pkgname}.fish
	install -Dm644 _${_pkgname} "$pkgdir"/usr/share/zsh/site-functions/_${_pkgname}

	# license
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
