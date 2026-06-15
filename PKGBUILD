# Maintainer: tee < teeaur at duck dot com >
_pkg=prql
pkgname=prql-bin
pkgver=0.13.13
pkgrel=1
pkgdesc='PRQL is a modern language for transforming data — a simple, powerful, pipelined SQL replacement'
arch=(x86_64)
url='https://prql-lang.org'
_git='https://github.com/PRQL/prql'
license=(Apache-2.0)
provides=($_pkg)
conflicts=($_pkg)
source_x86_64=("$_git/releases/download/$pkgver/prqlc-$pkgver-$arch-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('d74473c8870d7076ccdbe0f25162de4af84062c8d08220f5a66f1aca4affa1ca')

package() {
    install -Dm755 prqlc -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/${pkgname}/"

	mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
	./prqlc shell-completion bash > "${pkgdir}/usr/share/bash-completion/completions/prqlc"
	mkdir -p "${pkgdir}/usr/share/elvish/lib/"
	./prqlc shell-completion elvish > "$pkgdir/usr/share/elvish/lib/prqlc.elv"
	mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d/"
	./prqlc shell-completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/prqlc.fish"
	mkdir -p "${pkgdir}/usr/share/nushell/vendor/autoload"
	./prqlc shell-completion nushell > "$pkgdir/usr/share/nushell/vendor/autoload/prqlc.nu"
	mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
	./prqlc shell-completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_$_pkg"
}
# vim:set noet sts=0 sw=4 ts=4:
