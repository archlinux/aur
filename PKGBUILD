# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=getsentry-cli-bin
_pkgname=getsentry-cli
pkgver=0.39.0
pkgrel=1
pkgdesc="Official Sentry developer CLI by getsentry/cli (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/getsentry/cli"
license=('LicenseRef-FSL-1.1-Apache-2.0')
depends=('glibc' 'gcc-libs')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip')

source=("LICENSE-${pkgver}::${url}/raw/${pkgver}/LICENSE.md")
source_x86_64=("${pkgname}-${pkgver}-x86_64.gz::${url}/releases/download/${pkgver}/sentry-linux-x64.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.gz::${url}/releases/download/${pkgver}/sentry-linux-arm64.gz")
noextract=(
    "${pkgname}-${pkgver}-x86_64.gz"
    "${pkgname}-${pkgver}-aarch64.gz"
)

sha256sums=('c51f382a888f8f59f54a72af01e2d72032f2ba8f31d8194f8bf489123438195a')
sha256sums_x86_64=('504425b1c5ddb2cd3d2f3ba3580b5a051b820cfdbd1d40b8035af6ee77bd5c63')
sha256sums_aarch64=('71c2c1180f131e6cfd1b4802e1c3615ac7f0c0a74dc0b52e316f5f07ade42212')

package() {
    install -d "${pkgdir}/usr/bin"
    gzip -cd "${srcdir}/${pkgname}-${pkgver}-${CARCH}.gz" > "${pkgdir}/usr/bin/sentry"
    chmod 755 "${pkgdir}/usr/bin/sentry"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
