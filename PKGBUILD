# Maintainer: huochenghai <huochenghai@gmail.com>
pkgname="binggpt-desktop-bin"
pkgver="0.3.7"
pkgrel=1
pkgdesc="Desktop application of new Bing's AI-powered chat"
arch=("x86_64" "aarch64")
url="https://github.com/dice2o/BingGPT"
makedepends=("binutils"
        "tar")
depends=("at-spi2-core"
        "alsa-lib"
        "gtk3"
        "nss")
provides=("binggpt-desktop=${pkgver}")
conflicts=('binggpt-desktop')
license=("Apache")
source=("https://github.com/dice2o/BingGPT/releases/download/v${pkgver}/BingGPT-${pkgver}-linux-x64.deb")
sha256sums=('09f791fd5bab28a5754df34575a115e8e14c262a2cb1244749d5128a73593ca2')
source_aarch64=("https://github.com/dice2o/BingGPT/releases/download/v${pkgver}/BingGPT-${pkgver}-linux-arm64.deb")
sha256sums_aarch64=('20bbbba11f040366fe58ce053633f29bc39f69ac225dccc1fabc02d47fed724c')

prepare() {
        if [ "$CARCH" = "aarch64" ]; then
                ar p BingGPT-${pkgver}-linux-arm64.deb data.tar.xz | tar --zstd -x
        else
                ar p BingGPT-${pkgver}-linux-x64.deb data.tar.xz | tar --zstd -x
        fi
}

package() {
        cd $srcdir
        cp -R usr ${pkgdir}
}
