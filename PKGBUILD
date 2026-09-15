# Maintainer: Rashesh Padia
pkgname=collabora-office-bin
pkgver=26.04.3.3
pkgrel=1
_source_tag=cp-26.04.3-3
pkgdesc='Collabora Office - Qt6 desktop document editor powered by Collabora Online'
arch=('x86_64')
url='https://collaboraoffice.com'
license=('MPL-2.0')
provides=("collabora-office=${pkgver}")
conflicts=('collabora-office')
replaces=('collabora-office')
# Derived from the system-libraries.txt asset that the build publishes next to
# the payload, which lists every library the payload loads from outside itself.
# fontconfig is here for /etc/fonts and fc-cache, because the payload carries
# its own libfontconfig-lo. Everything else the engine used to link against is
# built into the payload.
depends=(
    'qt6-base'
    'qt6-declarative'
    'qt6-positioning'
    'qt6-webchannel'
    'qt6-webengine'
    'qt6-websockets'
    'fontconfig'
    'hicolor-icon-theme'
    'mpdecimal'
    'nspr'
    'nss'
    'util-linux-libs'
    'zlib'
)
optdepends=(
    'hunspell-en_us: English spell checking'
    'hyphen-en: English hyphenation'
    'ttf-carlito: metric substitute for the sans-serif font OOXML documents ask for'
    'ttf-caladea: metric substitute for the serif font OOXML documents ask for'
    'ttf-liberation: metric substitutes for Arial, Courier New and Times New Roman'
    'noto-fonts: Noto font family'
    'noto-fonts-cjk: CJK font support'
    'ttf-dejavu: DejaVu fonts'
)
options=('!strip' '!debug')
# Nothing is compiled here. The payload is built on GitHub Actions from one
# cp-26.04 monorepo tree: engine runtime, online/Qt app and branding are built
# together in an Arch Linux container and published as a single release asset.
# This package only unpacks that asset.
# https://github.com/Rash419/collabora-office-asset
source=("collabora-office-${_source_tag}-x86_64.tar.zst::https://github.com/Rash419/collabora-office-asset/releases/download/${_source_tag}/collabora-office-${_source_tag}-x86_64.tar.zst")
sha256sums=('f1830f3ac5f384d9c2e6347748a0bd967a301253dc4c8c664f0397a8639ab968')

package() {
    cp -a "$srcdir/usr" "$pkgdir/"
}
