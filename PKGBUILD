# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=cursor-cli
# extracted from https://cursor.com/install (managed by 'update-pkgver.sh')
_upstream_ver='2025.08.25-896bbe1'
# Baseline pkgver; update using './update-pkgver.sh'
pkgver=2025.08.25.1.896bbe1
pkgrel=1
epoch=1
pkgdesc="Cursor Agent CLI - AI-powered code assistant"
arch=('x86_64' 'aarch64')
url="https://cursor.com"
license=('LicenseRef-Cursor')
# note: there are no deps - they bundle node in the tarball
source=('LICENSE')
source_x86_64=("cursor-cli-${_upstream_ver}-x86_64.tar.gz::https://downloads.cursor.com/lab/${_upstream_ver}/linux/x64/agent-cli-package.tar.gz")
source_aarch64=("cursor-cli-${_upstream_ver}-aarch64.tar.gz::https://downloads.cursor.com/lab/${_upstream_ver}/linux/arm64/agent-cli-package.tar.gz")
b2sums=('8191036b9df1f28c999bc484b7631165b92b6aa15e563b5ee19bfa08759ee76e3bc6466c1b1d69562a4e9b0378b9fabf34c44bf100b51c64a271c3d79a009e9c')
b2sums_x86_64=('5b3552583068ed25a5c7c3f50a0a9559986a5ec568ab9d56411016b3ef24675cd296b87ccc643dafa11b3de919627e2a8097504d927f2b11f810bc9fba918246')
b2sums_aarch64=('f9dc5074595008e8fe1d670bc58b16ecf300457745de7cc9b13fd9db3f63e72e2dfd45557ee6b58c08a050851b5d81ffe562380c4cd8138353458930bb5def30')

package() {
    # Create necessary directories
    install -dm755 "${pkgdir}/opt/cursor-agent"
    install -dm755 "${pkgdir}/usr/bin"

    # Copy all files from the extracted package
    cp -r "${srcdir}"/dist-package/* "${pkgdir}/opt/cursor-agent/"

    # Create symlink in /usr/bin
    ln -s "/opt/cursor-agent/cursor-agent" "${pkgdir}/usr/bin/cursor-agent"

	# Install license
	# This is downloaded from https://cursor.com/terms-of-service
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
