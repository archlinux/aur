# Maintainer: Bart Libert <bart plus aur at libert dot email>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Isaac Freund <ifreund@ifreund.xyz>

pkgname=zsh-abbr
pkgver=6.0.0
pkgrel=4
pkgdesc='The zsh manager for auto-expanding abbreviations, inspired by fish shell.'
arch=('any')
url='https://github.com/olets/zsh-abbr'
license=('LicenseRef-custom')
depends=('zsh')
makedepends=('git')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver::git+${url}.git#tag=v${pkgver}"
		"zsh-job-queue::git+https://github.com/olets/zsh-job-queue.git#commit=6073103")
b2sums=('88c4ca0b8b674e9ee83453478cc9bb64713bf271d4ea332bd38e27add4f474b1796e9233a403461a79001ba0881695942b6dbbee693f78ae3ebe6a635c074554'
        '767e5a5f1acbc2b1f251dd7af66a19dd503594ada855d0e1c129643f99f6b93e8c2b3c0b50f6d2b5d44eded2d5d6f2708cd3134612b13703cbc67f1f1ca45123')

prepare() {
	cd $pkgname-$pkgver
	git submodule init
	git config submodule.zsh-job-queue.url "$srcdir/zsh-job-queue"
	git -c protocol.file.allow=always submodule update
}

package() {
	cd "$pkgname-$pkgver"
	install -Dvm644 zsh-abbr{,.plugin}.zsh -t "$pkgdir/usr/share/zsh/plugins/$pkgname/"
	install -Dvm755 zsh-job-queue/zsh-job-queue{,.plugin}.zsh -t "$pkgdir/usr/share/zsh/plugins/$pkgname/zsh-job-queue/"
	install -Dvm644 completions/_abbr -t "$pkgdir/usr/share/zsh/site-functions/"
	install -Dvm755 man/man1/abbr.1 -t "$pkgdir/usr/share/man/man1/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
