pkgname=website-stalker-bin
pkgver=0.24.0
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

sha256sums_x86_64=('2896bca7d511f7a2ced0cad2b089590e953d5b0d8d3c3832bc5c72873810b22a')
sha256sums_aarch64=('bd0233373c8610d0449a978aeba0bb302a665be40e72baa48fc9fd954194ca0a')
sha256sums_armv6h=('e828ef49eb0bf16c9dcd356d762786ae4ea67961b8bded8facdbc25207dabba0')
sha256sums_armv7h=('9e1a4c12c7da05a34bc4f7cb29f2e471ddb36883bd574ec25ef8d47961b7d92c')
sha256sums_riscv64=('00e24fb60b82821ae35d6becac2d17bae257f881529f3e3f045ee37b1baed6e3')

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
