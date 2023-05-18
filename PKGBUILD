pkgname=website-stalker-bin
pkgver=0.20.0
pkgrel=3
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

sha256sums_x86_64=('144e14947950ecfb7ac0f83d5232de922a3940f27bccd7cc97adfa44b9124389')
sha256sums_aarch64=('a46a2865ad573582eb3d899e1eab121c97e5ac58fe41dead10374cad5bf72e2d')
sha256sums_armv6h=('3a51f5fbc77c7b5855ce345f939379d224d1f6e53a9e9e9cbb5285f4a3419602')
sha256sums_armv7h=('f67fda01f208508a2d832d79b74fcda64523fcbbff733a4c3728207ef0095ade')

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
