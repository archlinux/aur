# Maintainer: huochenghai <huochenghai@gmail.com>
pkgname="sparkle-bin"
pkgver="1.26.5"
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
sha256sums=('e29b480caa925ac77d9278b8d4b49ad057404f4294aa64de9655198d28572c7b')
source_aarch64=("https://github.com/xishang0128/sparkle/releases/download/${pkgver}/sparkle-linux-${pkgver}-arm64.deb")
sha256sums_aarch64=('383d4331af3413e8e5bc462e98c8c3bc76c63120c9b30ed2de613b68829efc3f')

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
        chmod +x ${pkgdir}/opt/sparkle/resources/files/sparkle-service
        chmod +sx ${pkgdir}/opt/sparkle/resources/sidecar/mihomo
        chmod +sx ${pkgdir}/opt/sparkle/resources/sidecar/mihomo-alpha
}
