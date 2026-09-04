# Maintainer: ItzTas <ts.aur@imts.aleeas.com>

pkgname=luadot-bin
_pkgname=luadot
pkgver=0.3.0
pkgrel=1
pkgdesc='A dotfiles manager configured in Lua (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/ItzTas/luadot'
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
_registry='https://gitlab.digitalventura.com.br/api/v4/projects/luadot%2Fluadot/packages/generic/luadot'
_version=0.3.0
source_x86_64=("$_registry/$_version/$_pkgname-$pkgver-x86_64.tar.gz")
source_aarch64=("$_registry/$_version/$_pkgname-$pkgver-aarch64.tar.gz")
sha256sums_x86_64=('faf4365481ec7eef6c7694499c33da57bf53cb06f9b2a08403b3ed240a89c7a0')
sha256sums_aarch64=('83bfb438387b391613a005ed2599f665631ff4566b9e27404254d2cbf1e87b26')

package() {
	cd "$_pkgname-$pkgver-$CARCH"
	install -Dm0755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm0644 LICENSE.lpeg "$pkgdir/usr/share/licenses/$pkgname/LICENSE.lpeg"

	install -Dm0644 "completions/$_pkgname.bash" \
		"$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	install -Dm0644 "completions/_$_pkgname" \
		"$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
	install -Dm0644 "completions/$_pkgname.fish" \
		"$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"

	install -Dm0644 "$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
