# Maintainer: ItzTas <ts.aur@imts.aleeas.com>

pkgname=mime-guardian-bin
_pkgname=mime-guardian
_bin=mmg
pkgver=0.1.0
pkgrel=1
pkgdesc='Keeps your default applications the way you set them (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/ItzTas/mime-guardian'
license=('MIT')
depends=('gcc-libs' 'glibc')
optdepends=('libnotify: desktop notifications when a default is put back'
	'shared-mime-info: wildcard types such as image/*')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
_releases='https://github.com/ItzTas/mime-guardian/releases/download'
_tag=v0.1.0
source_x86_64=("$_releases/$_tag/$_pkgname-$pkgver-x86_64.tar.gz")
source_aarch64=("$_releases/$_tag/$_pkgname-$pkgver-aarch64.tar.gz")
sha256sums_x86_64=('91082365051e7f458aa6c5566336fd6e7f8a211f46450b87611771cb259cb394')
sha256sums_aarch64=('19d9e9f266737b6000745d181bc41ceadf0e045ab3fad14dfa04a3dc889bdbbf')

package() {
	cd "$_pkgname-$pkgver-$CARCH"
	install -Dm0755 "$_bin" "$pkgdir/usr/bin/$_bin"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm0644 "$_pkgname.service" "$pkgdir/usr/lib/systemd/user/$_pkgname.service"

	install -Dm0644 "completions/$_bin.bash" \
		"$pkgdir/usr/share/bash-completion/completions/$_bin"
	install -Dm0644 "completions/_$_bin" \
		"$pkgdir/usr/share/zsh/site-functions/_$_bin"
	install -Dm0644 "completions/$_bin.fish" \
		"$pkgdir/usr/share/fish/vendor_completions.d/$_bin.fish"

	install -Dm0644 "$_bin.1" "$pkgdir/usr/share/man/man1/$_bin.1"
}
