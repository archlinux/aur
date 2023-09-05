pkgname=website-stalker-bin
pkgver=0.21.0
pkgrel=1
pkgdesc="Track changes on websites via git"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/EdJoPaTo/${pkgname/-bin/}"
license=('LGPL2.1')
depends=('gcc-libs' 'zlib')
optdepends=('git: git commit support')
provides=("${pkgname/-bin/}")
conflicts=("${pkgname/-bin/}")

source_x86_64=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
source_armv6h=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-arm-unknown-linux-gnueabihf.tar.gz")
source_armv7h=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-armv7-unknown-linux-gnueabihf.tar.gz")

sha256sums_x86_64=('52dc85c812babc9ccf65c5aff8a771a61210b9272cc8068996ee363278f536ad')
sha256sums_aarch64=('c1376a65f893adca352aa25900a79ea8d2fde3bd6b301483b83a377cc4f0be14')
sha256sums_armv6h=('27ed1b87ff2d3e92f0d4ab3f6611cd3b72f4dbd79b2e68bf6cbf6dcef15a1e24')
sha256sums_armv7h=('02155168e31ef9885c568a3be23c135a3523f06e6a3e1b9f0ff904606f0e5fe2')

package() {
	install -Dm755 "${pkgname/-bin/}" -t "${pkgdir}/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname/-bin/}/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/${pkgname/-bin/}/"

	install -Dm644 "completions/${pkgname/-bin/}.bash" -t "${pkgdir}/usr/share/bash-completion/completions/"
	install -Dm644 "completions/${pkgname/-bin/}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d/"
	install -Dm644 "completions/_${pkgname/-bin/}" -t "${pkgdir}/usr/share/zsh/site-functions/"

	install -Dm644 "systemd/system/service" "${pkgdir}/usr/lib/systemd/system/${pkgname/-bin/}.service"
	install -Dm644 "systemd/system/timer" "${pkgdir}/usr/lib/systemd/system/${pkgname/-bin/}.timer"
	install -Dm644 "systemd/system/sysuser" "${pkgdir}/usr/lib/sysusers.d/${pkgname/-bin/}.conf"
	install -Dm644 "systemd/system/tmpfile" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname/-bin/}.conf"

	install -Dm644 "systemd/user/service" "${pkgdir}/usr/lib/systemd/user/${pkgname/-bin/}.service"
	install -Dm644 "systemd/user/timer" "${pkgdir}/usr/lib/systemd/user/${pkgname/-bin/}.timer"
}

check() {
	eval "./website-stalker --help"
}
