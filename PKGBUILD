# Maintainer: Pando85 <pando855@gmail.com>
_pkgname=passless
pkgname="${_pkgname}-bin"
pkgver=0.24.1
pkgrel=1
pkgdesc="Virtual FIDO2 device and client FIDO 2 utility. Passkeys made easy."
arch=('x86_64' 'aarch64')
url="https://github.com/pando85/passless"
license=('GPL')
install=passless.install
depends=('gcc-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://github.com/pando85/passless/releases/download/v${pkgver}/passless-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz"
        "passless-${pkgver}.tar.gz::https://github.com/pando85/passless/archive/refs/tags/v${pkgver}.tar.gz"
        "https://github.com/pando85/passless/releases/download/v${pkgver}/passless-completions-${pkgver}.tar.gz"
        "passless.install")
sha256sums=('a0230a918cdf52907abfb2dd34e2d3c94b42b5d08de3875ab7f1c90fdf208be1'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
	install -Dm755 passless "${pkgdir}/usr/bin/passless"
	install -Dm755 passless-git-sync "${pkgdir}/usr/bin/passless-git-sync"
	install -Dm755 sign-proxy "${pkgdir}/usr/bin/sign-proxy"
	install -Dm755 agent-prompt-probe "${pkgdir}/usr/bin/agent-prompt-probe"

	# Install shell completions (the tarball is required, fail if any file is missing)
	install -Dm0644 passless.bash \
		"${pkgdir}/usr/share/bash-completion/completions/passless"
	install -Dm0644 passless.fish \
		"${pkgdir}/usr/share/fish/vendor_completions.d/passless.fish"
	install -Dm0644 _passless \
		"${pkgdir}/usr/share/zsh/site-functions/_passless"
	install -Dm0644 passless.elv \
		"${pkgdir}/usr/share/elvish/lib/passless.elv"

	install -Dm0644 "passless-${pkgver}/contrib/systemd/passless.service" \
		"${pkgdir}/usr/lib/systemd/user/passless.service"
	install -Dm0644 "passless-${pkgver}/contrib/udev/90-passless.rules" \
		"${pkgdir}/usr/lib/udev/rules.d/90-passless.rules"
	install -Dm0644 "passless-${pkgver}/contrib/sysusers.d/passless.conf" \
		"${pkgdir}/usr/lib/sysusers.d/passless.conf"
	install -Dm0644 "passless-${pkgver}/contrib/modules-load.d/fido.conf" \
		"${pkgdir}/etc/modules-load.d/fido.conf"
}
