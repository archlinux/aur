# Maintainer: huochenghai <huochenghai@gmail.com>
pkgname="sparkle-bin"
pkgver="1.26.1"
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
sha256sums=('8127e33e14769cc975a8bd485ea58e235d9c1abcce04f2ba3bb0273cf1e0d344')
source_aarch64=("https://github.com/xishang0128/sparkle/releases/download/${pkgver}/sparkle-linux-${pkgver}-arm64.deb")
sha256sums_aarch64=('956c12deee3ba985c453db1be998fb0cb25288ee8b0056988d99e51076b20ce0')

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
