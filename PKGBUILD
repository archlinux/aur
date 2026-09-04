# Maintainer: ItzTas <ts.aur@imts.aleeas.com>

pkgname=luadot-bin
_pkgname=luadot
pkgver=0.3.1
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
_version=0.3.1
source_x86_64=("$_registry/$_version/$_pkgname-$pkgver-x86_64.tar.gz")
source_aarch64=("$_registry/$_version/$_pkgname-$pkgver-aarch64.tar.gz")
sha256sums_x86_64=('d3d96676eae774f45437b6ffe546abaa4ed801d9ffffe5184c2c6da1792c03d8')
sha256sums_aarch64=('01dc26eea6704756aa0937325bd1606931b09b1c8227566b8fc099ce72345f60')

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
