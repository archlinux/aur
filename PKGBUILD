# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=cursor-cli
# extracted from https://cursor.com/install (managed by 'update-pkgver.sh')
_upstream_ver='2025.08.15-dbc8d73'
# Baseline pkgver; update using './update-pkgver.sh'
pkgver=2025.08.15.1.dbc8d73
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
b2sums=('7079c023e03ea4d78b067ed0f22b5cc1982c306721b2ea6be3c7f73bbbe0e8f05b148fd6571902b838464ee80a787ef7be73135c622f0a4fdb16c38429ced8d6')
b2sums_x86_64=('f2c1c243339ced6fc93f2b1552d0bfaca89fc36d7ee9b4e5813d6ca8962c58e1a1ba41ef3322defcfe41311abe76c2b502c7710b6ee7320f38179516d828da13')
b2sums_aarch64=('58cc6a006aa8560b49d8bc217f70bf3aae67e98414255b17bc2863ba147513fadb4b5815f26ea98361d6942e634ac02b2618acc1c5175dd8a11a56484153d4aa')

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
