# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=phpactor-bin
pkgver=2025.07.25.0 # datasource=github-releases depName=phpactor/phpactor
pkgrel=1
pkgdesc='Mainly a PHP Language Server with more features than you can shake a stick at'
arch=('any')
url='https://github.com/phpactor/phpactor'
license=('MIT')
depends=('php')
provides=('phpactor')
conflicts=('phpactor' 'phpactor-git')

source=("phpactor-${pkgver}.phar::${url}/releases/download/${pkgver}/phpactor.phar"
        "LICENSE-${pkgver}::${url}/raw/refs/tags/${pkgver}/LICENSE")

sha256sums=('a1ca78dcc143f54cc0addc344aa4bd306d2647c9e2f3fdedb0727668a9915f0a'
            '4287c3b7c293133dc59e92cb32a1aae899c4441ac6d64455c537c82070c84caa')

package() {

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm755 "phpactor-${pkgver}.phar" "${pkgdir}/usr/share/${pkgname}/phpactor.phar"

	local target="${pkgdir}/usr/bin/phpactor"

	mkdir -p "${pkgdir}/usr/bin"
	ln -sr "${pkgdir}/usr/share/phpactor-bin/phpactor.phar" "${target}"

	$target completion bash | \
	install -Dm0644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$pkgbase.bash"

	$target completion fish | \
	install -Dm0644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$pkgbase.fish"

	$target completion zsh | \
	install -Dm0644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$pkgbase"
}
