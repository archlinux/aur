# Maintainer: yuioto <yuiotochan@outlook.com>

pkgname=fav-bin
_pkgname=fav
pkgver=1.1.1
pkgrel=1
pkgdesc='Back up your favorite bilibili resources with CLI'
arch=('x86_64')
url="https://github.com/kingwingfly/${_pkgname}"
# license=('LicenseRef-MIT')
license=('custom:MIT')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
OPTIONS=(!debug)
source=("${_pkgname}-${pkgver}.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_bili-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
	"LICENSE-${pkgver}::$url/raw/v${pkgver}/LICENSE")
sha256sums=('128eaf00b5e8e9324e7f815b8cc62ed48082aad8fbd3312ac7b6ecacd5092980'
            '54e2d4c99f8d0eacb6dd9cae4c1bddce86fe7926d29cdb0ceded4d3797df0d65')

package() {
	mv ${_pkgname}_bili ${_pkgname}
	install -Dm755 ${_pkgname} "$pkgdir"/usr/bin/${_pkgname}

	# completions
	./${_pkgname} completion bash > ${_pkgname}.bash
	./${_pkgname} completion fish > ${_pkgname}.fish
	./${_pkgname} completion zsh > _${_pkgname}
	install -Dm644 ${_pkgname}.bash "$pkgdir"/usr/share/bash-completion/completions/${_pkgname}
	install -Dm644 ${_pkgname}.fish "$pkgdir"/usr/share/fish/vendor_completions.d/${_pkgname}.fish
	install -Dm644 _${_pkgname} "$pkgdir"/usr/share/zsh/site-functions/_${_pkgname}

	# license
	install -Dm644 LICENSE-${pkgver} "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
