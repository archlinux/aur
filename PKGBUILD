# Maintainer: Bart Libert <bart plus aur at libert dot email>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Isaac Freund <ifreund@ifreund.xyz>

pkgname=zsh-abbr
pkgver=6.3.3
pkgrel=1
pkgdesc='The zsh manager for auto-expanding abbreviations, inspired by fish shell.'
arch=('any')
url='https://github.com/olets/zsh-abbr'
license=('LicenseRef-custom')
depends=('zsh')
makedepends=('git')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver::git+${url}.git#tag=v${pkgver}"
		"zsh-job-queue::git+https://github.com/olets/zsh-job-queue.git#commit=80327a7")
b2sums=('7440f45bbf7f4cd73f2674eeba0a267c18b57f0b1a809d2ad78a52202e1aa502c6ad4a96a1c727b99cfcb231e6ebe825759839bd9f629174d2cd9f10b09155a1'
        'a9cb18e69ba78ad49c938ae7286593b3bbee2e6314adddd711b70543b25cf5fd372a9dbcd86749370abd764344aff0e4070c2791f9a016d5a84b9a5fb323b1b4')

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
