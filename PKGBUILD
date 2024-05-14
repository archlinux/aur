pkgname=website-stalker-bin
pkgver=0.23.0
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

sha256sums_x86_64=('49de464b81f923ee05af8a05bd01ce4cd9e4934f21d2337488ae5e1a2569aec1')
sha256sums_aarch64=('fa401e7429957f22dbc124b35fbcdae4b205d2effd39ee894f7fccda6b94144e')
sha256sums_armv6h=('3e0ca222329ad0d2543e2241726b216ea4756a11a0a24350f77ca32cddb14bf8')
sha256sums_armv7h=('43cd8bf56ea090427bbc642c9d4cf21bee3c1cc9ef9835a0512b3862365741aa')
sha256sums_riscv64=('079df84516a0d0d1be9734287bab268891a4a7e05b8f63410fb6177a247373c3')

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
