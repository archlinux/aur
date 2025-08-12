# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=cursor-cli
# extracted from https://cursor.com/install (managed by 'update-pkgver.sh')
_upstream_ver='2025.08.09-d8191f3'
# Baseline pkgver; update using './update-pkgver.sh'
pkgver=2025.08.09.1.d8191f3
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
b2sums_x86_64=('cf66840bc84bbc01a4d9a489847ab60e97762172e852dfd872c3a25e3b78a51ed33e5a4dd6df97e9afaa22a68f4601f7d1497e5335b568e5d1d7e69ec16a1f25')
b2sums_aarch64=('979dc1bc8915cbcc689a3175275c2e5cb8d0cc8140781776f24d41b91a86693b27174d818833f804e17cf5ac472039ea3813647e7aec88e953821cd7e558e244')

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
