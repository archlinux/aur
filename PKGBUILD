# Maintainer: huochenghai <huochenghai@gmail.com>
pkgname="sparkle-bin"
pkgver="1.6.12"
pkgrel=1
pkgdesc="Another Mihomo GUI"
arch=("x86_64" "aarch64")
url="https://github.com/xishang0128/sparkle"
makedepends=("binutils" "tar")
depends=("libxrandr" "libxcb" "mesa" "libxdamage" "libcups"
"dbus" "alsa-lib" "pango" "glibc" "gtk3" "nspr" "gcc-libs"
"cairo" "at-spi2-core" "expat" "libxkbcommon" "glib2" "libxcomposite"
"libxext" "libx11" "nss" "systemd-libs" "libxfixes")
provides=("sparkle=${pkgver}")
conflicts=('sparkle' 'sparkle-git' 'sparkle-electron-git')
license=("GPL-3.0-only")
source=("https://github.com/xishang0128/sparkle/releases/download/${pkgver}/sparkle-linux-${pkgver}-amd64.deb")
sha256sums=('8c4c6a035e5f692be48d7300bca3300f0b1d0638a31b784ec9fd23d49ee31ff0')
source_aarch64=("https://github.com/xishang0128/sparkle/releases/download/${pkgver}/sparkle-linux-${pkgver}-arm64.deb")
sha256sums_aarch64=('d6165ae43afe161f6f73ed3ae9335cbe01f8e0b831e6c79bbcc2923be6e1f41e')

prepare() {
        if [ "$CARCH" = "aarch64" ]; then
                ar p sparkle-linux-${pkgver}-arm64.deb data.tar.xz | tar --zstd -x
        else
                ar p sparkle-linux-${pkgver}-amd64.deb data.tar.xz | tar --zstd -x
        fi
}

package() {
        cd $srcdir
        cp -R usr ${pkgdir}
        cp -R opt ${pkgdir}
        chmod +x ${pkgdir}/opt/sparkle/resources/files/sysproxy
        chmod +sx ${pkgdir}/opt/sparkle/resources/sidecar/mihomo
        chmod +sx ${pkgdir}/opt/sparkle/resources/sidecar/mihomo-alpha
}
