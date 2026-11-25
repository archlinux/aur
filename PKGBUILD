# Maintainer: arch-lsf <liangshengfeng@star-net.cn>
# Maintainer: Fabio Di Giorgio <ravnos at duck dot com>

pkgname=openidea-bin
pkgver=0.1.52
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
sha256sums_x86_64=('44d6f374129563ef43b174b9d986180b4befad7bc306a84205f9e6de79c98461')
sha256sums_aarch64=('2327d8542eaa30b0cd617ec389d5b88cf12c1b58ff4d8da73c6b30844a480eda')

package() {
    # The RPM payload already contains /usr/bin/openidea, the desktop entry
    # and the hicolor icons.
    bsdtar -xf "OpenIDEA-${pkgver}-1.${CARCH}.rpm" -C "${pkgdir}"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
