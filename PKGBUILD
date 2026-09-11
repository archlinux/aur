# Maintainer: Rashesh Padia
pkgname=collabora-office
pkgver=26.04.2.4
pkgrel=2
_source_tag=cp-26.04.2-4
pkgdesc='Collabora Office - Qt6 desktop document editor powered by Collabora Online'
arch=('x86_64')
url='https://collaboraoffice.com'
license=('MPL-2.0')
# Derived from the system-libraries.txt asset that the build publishes next to
# the payload, which lists every library the payload loads from outside itself.
# cups and dbus are loaded at run time rather than linked, and fontconfig is
# here for /etc/fonts and fc-cache: the payload carries its own
# libfontconfig-lo.
depends=(
    'qt6-base'
    'qt6-declarative'
    'qt6-positioning'
    'qt6-webchannel'
    'qt6-webengine'
    'cups'
    'dbus'
    'expat'
    'fontconfig'
    'hicolor-icon-theme'
    'libpng'
    'nspr'
    'nss'
    'util-linux-libs'
    'zlib'
    'zstd'
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
# Fully pre-built on GitHub Actions from one cp-26.04 monorepo tree: engine
# runtime, online/Qt app and branding are built together in an Arch Linux
# container and published as a single release asset. poco is linked
# statically from the engine workdir, so it is not a dependency.
# https://github.com/Rash419/collabora-core-assets
source=("collabora-office-${_source_tag}-x86_64.tar.zst::https://github.com/Rash419/collabora-core-assets/releases/download/${_source_tag}/collabora-office-${_source_tag}-x86_64.tar.zst")
# Fill in from the sha256sums line in the release notes for ${_source_tag},
# once the desktop tarball for that tag has been built. This has to carry the
# real checksum before the package is published.
sha256sums=('SKIP')

package() {
    cp -a "$srcdir/usr" "$pkgdir/"
}
