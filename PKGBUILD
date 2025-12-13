# Maintainer: tee < teeaur at duck dot com >
_pkg=prql
pkgname=prql-bin
pkgver=0.13.8
pkgrel=1
pkgdesc='PRQL is a modern language for transforming data — a simple, powerful, pipelined SQL replacement'
arch=(x86_64)
url='https://prql-lang.org'
_git='https://github.com/PRQL/prql'
license=(Apache-2.0)
provides=($_pkg)
conflicts=($_pkg)
source_x86_64=("$_git/releases/download/$pkgver/prqlc-$pkgver-$arch-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('1edf208508d0b1f4e0941e96d1d7046e475b8cf67c3cc3270c4478db4fa329cd')

package() {
    install -Dm755 prqlc -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/${pkgname}/"

	mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
	./prqlc shell-completion bash > "${pkgdir}/usr/share/bash-completion/completions/$_pkg"
	mkdir -p "${pkgdir}/usr/share/elvish/lib/"
	./prqlc shell-completion elvish > "$pkgdir/usr/share/elvish/lib/$_pkg.elv"
	mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d/"
	./prqlc shell-completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/$_pkg.fish"
	mkdir -p "${pkgdir}/usr/share/nushell/vendor/autoload"
	./prqlc shell-completion nushell > "$pkgdir/usr/share/nushell/vendor/autoload/$_pkg.nu"
	mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
	./prqlc shell-completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_$_pkg"
}
# vim:set noet sts=0 sw=4 ts=4:
