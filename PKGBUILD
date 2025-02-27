# Maintainer: Bart Libert <bart plus aur at libert dot email>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Isaac Freund <ifreund@ifreund.xyz>

pkgname=zsh-abbr
pkgver=6.2.1
pkgrel=1
pkgdesc='The zsh manager for auto-expanding abbreviations, inspired by fish shell.'
arch=('any')
url='https://github.com/olets/zsh-abbr'
license=('LicenseRef-custom')
depends=('zsh')
makedepends=('git')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver::git+${url}.git#tag=v${pkgver}"
		"zsh-job-queue::git+https://github.com/olets/zsh-job-queue.git#commit=6073103")
b2sums=('0d5f7f3476da95d70d4f14a2ec4c2c34487f63ff2584a9b25545c7e12cb85a459e96956e18b9345800f1387053cb391abe79ed40bb8c4ed7531c36a3a66423cb'
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
