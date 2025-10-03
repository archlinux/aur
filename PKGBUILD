pkgname=website-stalker-bin
pkgver=0.27.0
pkgrel=1
pkgdesc="Track changes on websites via git"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h' 'riscv64')
url="https://github.com/EdJoPaTo/${pkgname/-bin/}"
license=('LGPL-2.1-or-later')
depends=('gcc-libs')
optdepends=('git: git commit support')
provides=("${pkgname/-bin/}")
conflicts=("${pkgname/-bin/}")

source_x86_64=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
source_armv6h=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-arm-unknown-linux-gnueabihf.tar.gz")
source_armv7h=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-armv7-unknown-linux-gnueabihf.tar.gz")
source_riscv64=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-riscv64gc-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('e112b3103654d29c661df261fec619596511980eaae9c90f21e86a322c48c652')
sha256sums_aarch64=('ea97a71fa888a455d732e1cef7836c858b67f8434bb7ad80c49f5d9230a76b88')
sha256sums_armv6h=('f21a0c15646dcb4f88e9da51a1d67905bb88e24e3b56acbf4091b727f4a8c23c')
sha256sums_armv7h=('cf5a307c7520bc09443261015f8c23260183e6e8a38f533f7e5c72545e1beecc')
sha256sums_riscv64=('134dde67b63698f680404e4ae8c8d36bc778d6effc34656bc0fc74dff0df7b68')

check() {
	eval "./website-stalker --help"
}

package() {
	install -Dm755 ${pkgname/-bin/} -t "${pkgdir}/usr/bin/"
	install -Dm644 CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname/-bin/}/"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname/-bin/}/"
	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname/-bin/}/"

	install -Dm644 "completions/${pkgname/-bin/}.bash" -t "${pkgdir}/usr/share/bash-completion/completions/"
	install -Dm644 "completions/${pkgname/-bin/}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d/"
	install -Dm644 "completions/_${pkgname/-bin/}" -t "${pkgdir}/usr/share/zsh/site-functions/"

	for man in manpages/*; do
		install -Dm644 "$man" -t "${pkgdir}/usr/share/man/man1/"
	done

	install -Dm644 "systemd/system/service" "${pkgdir}/usr/lib/systemd/system/${pkgname/-bin/}.service"
	install -Dm644 "systemd/system/timer" "${pkgdir}/usr/lib/systemd/system/${pkgname/-bin/}.timer"
	install -Dm644 "systemd/system/sysuser" "${pkgdir}/usr/lib/sysusers.d/${pkgname/-bin/}.conf"
	install -Dm644 "systemd/system/tmpfile" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname/-bin/}.conf"

	install -Dm644 "systemd/user/service" "${pkgdir}/usr/lib/systemd/user/${pkgname/-bin/}.service"
	install -Dm644 "systemd/user/timer" "${pkgdir}/usr/lib/systemd/user/${pkgname/-bin/}.timer"
}
