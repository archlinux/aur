# Maintainer: arch-lsf <liangshengfeng@star-net.cn>

pkgname=openidea-bin
pkgver=0.1.26
pkgrel=1
pkgdesc="Open-source IntelliJ IDEA-style IDE rebuilt in Rust"
arch=('x86_64')
url="https://github.com/l0ng-ai/openidea"
license=('Apache-2.0')
depends=('glibc' 'glib2' 'gtk3' 'webkit2gtk-4.1' 'gdk-pixbuf2' 'cairo' 'dbus' 'libsoup3')
provides=('openidea')
conflicts=('openidea')
options=('!strip' '!debug')
# Upstream publishes the Linux desktop app as a binary RPM (desktop entry and
# icons included), so the release artifact is used as-is.
source=("OpenIDEA-${pkgver}-1.x86_64.rpm::https://github.com/l0ng-ai/openidea/releases/download/v${pkgver}/OpenIDEA-${pkgver}-1.x86_64.rpm"
        "LICENSE")
sha256sums=('e326ef81e3e3847a2d7bcb4bb8d41dad596f0f3ba70cbe0a3df238adc5c543a7'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')

package() {
    # The RPM payload already contains /usr/bin/openidea, the desktop entry
    # and the hicolor icons.
    bsdtar -xf "OpenIDEA-${pkgver}-1.x86_64.rpm" -C "${pkgdir}"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
