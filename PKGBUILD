# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=cursor-cli
# extracted from https://cursor.com/install
_ver_hash=32c684dc5c8a0e364043db77d4e5b9a5dc1e2d3b
_date_ver=0
pkgver=20250808.0.32c684dc5c8a0e364043db77d4e5b9a5dc1e2d3b
pkgrel=1
pkgdesc="Cursor Agent CLI - AI-powered code assistant"
arch=('x86_64' 'aarch64')
url="https://cursor.com"
license=('custom:cursor')
# note: there are no deps - they bundle node in the tarball
source_x86_64=("cursor-cli-${_ver_hash}-x86_64.tar.gz:https://downloads.cursor.com/lab/${_ver_hash}/linux/x64/agent-cli-package.tar.gz")
source_aarch64=("cursor-cli-${_ver_hash}-aarch64.tar.gz:https://downloads.cursor.com/lab/${_ver_hash}/linux/arm64/agent-cli-package.tar.gz")
b2sums_x86_64=('936c8a7dab8561c02b72abcc27c1e1b606a6b4b7e9771aa98bd55d580bc457300f8feda8526bee3d07863bdbd010d4cd551f74cb00ba5f075d37c39ff00d8929')
b2sums_aarch64=('936c8a7dab8561c02b72abcc27c1e1b606a6b4b7e9771aa98bd55d580bc457300f8feda8526bee3d07863bdbd010d4cd551f74cb00ba5f075d37c39ff00d8929')

pkgver() {
	echo "$(date +%Y%m%d).${_date_ver}.${_ver_hash}"
}

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
