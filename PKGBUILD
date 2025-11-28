# Maintainer: Bart Libert <bart plus aur at libert dot email>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Isaac Freund <ifreund@ifreund.xyz>

pkgname=zsh-abbr
pkgver=6.4.0
pkgrel=1
pkgdesc='The zsh manager for auto-expanding abbreviations, inspired by fish shell.'
arch=('any')
url='https://github.com/olets/zsh-abbr'
license=('LicenseRef-custom')
depends=('zsh')
makedepends=('git')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver::git+${url}.git#tag=v${pkgver}"
		"zsh-job-queue::git+https://github.com/olets/zsh-job-queue.git#commit=9e99082")
b2sums=('d998b58fe79e6e2b58e84b0d8f62b3d875068adda5e25da73e6bbed7ab21e356ba64770975ad2c34c70f18136fd3c72b3678bde0a172a79dfcb2446d18304e5d'
        '39c06c8bebb4eb8501a09afe55df46eb8d9e091f88e50e337fddf89c2ba4d363bab0dc46d71294b0f47baee5fd788cec7975410d1c40ad9297a3f2d0f74216c0')

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
