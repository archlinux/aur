# Maintainer: huochenghai <huochenghai@gmail.com>
pkgname="alma-desktop-bin"
pkgver="0.4.796"
pkgrel=1
pkgdesc="A beautiful desktop application that unifies your AI experience. Seamlessly switch between OpenAI, Anthropic, Google Gemini, and custom providers."
arch=("x86_64")
url="https://alma.now"
_github_url="https://github.com/yetone/alma-releases"
makedepends=("libarchive")
depends=(libxcomposite nss libxdamage nodejs libxfixes libxext gcc-libs pango expat cairo vulkan-icd-loader nspr libxcb dbus glibc gtk3 libx11 bash at-spi2-core mesa alsa-lib glib2 libxrandr hicolor-icon-theme python libcups libxkbcommon systemd-libs java-runtime)
provides=("alma=${pkgver}")
conflicts=(alma-appimage)
license=("LicenseRef-custom")
source=("${_github_url}/releases/download/v${pkgver}/alma-${pkgver}-linux-amd64.deb")
sha256sums=('d8a02b1588acb2b1ea9812648571faa83386a1ebf483bab7d880132483bef3a3')

prepare() {
        local deb="alma-${pkgver}-linux-amd64.deb" member
        member=$(bsdtar -tf "$deb" | grep -E '^data\.tar\.[^/]+/?$' | head -1)
        member=${member%/}
        bsdtar -xOf "$deb" "$member" | bsdtar -xf -
}

package() {
        cd $srcdir
        cp -R usr ${pkgdir}
        cp -R opt ${pkgdir}
}
