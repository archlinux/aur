# Maintainer: huochenghai <huochenghai@gmail.com>
pkgname="sparkle-bin"
pkgver="1.6.7"
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
sha256sums=('5a9c876734372e4053a220572d4a14c791f86612b7279255a9760397ef4cb47a')
source_aarch64=("https://github.com/xishang0128/sparkle/releases/download/${pkgver}/sparkle-linux-${pkgver}-arm64.deb")
sha256sums_aarch64=('eeee42501f22e5bd8f5e11f0d31f2b8c21fc8dc0b635caf3d3436dcbbaea2a78')

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
}
