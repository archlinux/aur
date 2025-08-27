# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=cursor-cli
# extracted from https://cursor.com/install (managed by 'update-pkgver.sh')
_upstream_ver='2025.08.27-24c29c1'
# Baseline pkgver; update using './update-pkgver.sh'
pkgver=2025.08.27.1.24c29c1
pkgrel=1
epoch=1
pkgdesc="Cursor Agent CLI - AI-powered code assistant"
arch=('x86_64' 'aarch64')
url="https://cursor.com"
license=('LicenseRef-Cursor')
depends=('gcc-libs' 'bash' 'glibc')
source=('LICENSE')
source_x86_64=("cursor-cli-${_upstream_ver}-x86_64.tar.gz::https://downloads.cursor.com/lab/${_upstream_ver}/linux/x64/agent-cli-package.tar.gz")
source_aarch64=("cursor-cli-${_upstream_ver}-aarch64.tar.gz::https://downloads.cursor.com/lab/${_upstream_ver}/linux/arm64/agent-cli-package.tar.gz")
b2sums=('8191036b9df1f28c999bc484b7631165b92b6aa15e563b5ee19bfa08759ee76e3bc6466c1b1d69562a4e9b0378b9fabf34c44bf100b51c64a271c3d79a009e9c')
b2sums_x86_64=('d81e23f370d4cb2bbe651f12a8affb632475434fc4c1c81374cacdfa4b30306f52b78416a20a41b86f72cc5f7742fb80178a44e1635569afb50b3e0b2aa11fb1')
b2sums_aarch64=('663984804b935480f14713b359411c2a038db92dc501784f8bbb4c5e06f48bbf8bf45c5a95526de8f8b4b8148badea83e960535233e2f85d6a26f2920140be3b')

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
