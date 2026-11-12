# Maintainer: arch-lsf <liangshengfeng@star-net.cn>

pkgname=openidea-bin
pkgver=0.1.42
pkgrel=1
pkgdesc="Open-source IntelliJ IDEA-style IDE rebuilt in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/l0ng-ai/openidea"
license=('Apache-2.0')
depends=('glibc' 'glib2' 'gtk3' 'webkit2gtk-4.1' 'gdk-pixbuf2' 'cairo' 'dbus' 'libsoup3')
provides=('openidea')
conflicts=('openidea')
options=('!strip' '!debug')
# Upstream publishes the Linux desktop app as a binary RPM for each supported
# architecture (desktop entry and icons included), so the release artifact is
# used as-is.
source=("LICENSE")
source_x86_64=("OpenIDEA-${pkgver}-1.x86_64.rpm::https://github.com/l0ng-ai/openidea/releases/download/v${pkgver}/OpenIDEA-${pkgver}-1.x86_64.rpm")
source_aarch64=("OpenIDEA-${pkgver}-1.aarch64.rpm::https://github.com/l0ng-ai/openidea/releases/download/v${pkgver}/OpenIDEA-${pkgver}-1.aarch64.rpm")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('b8d6796572b938afd78411228a7f06adb049c1a3d15628cdc5dbb4764cb4fb63')
sha256sums_aarch64=('690090a7abab05e3842c6aca4febcd0716b6716b3610de76bbd11c408066fea8')

package() {
    # The RPM payload already contains /usr/bin/openidea, the desktop entry
    # and the hicolor icons.
    bsdtar -xf "OpenIDEA-${pkgver}-1.${CARCH}.rpm" -C "${pkgdir}"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
