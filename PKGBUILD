pkgname=android-pkg-config
pkgver=2
pkgrel=2
pkgdesc='Support pkg-config script (does not depend on any particular version of pkg-config). Useful for pkg-config powered cross-compiling for Android, see http://tinyurl.com/pkg-config-cross for more info'
arch=('any')
url='http://pkg-config.freedesktop.org/'
license=('zlib')
depends=('pkg-config')
source=('android-pkgconfig.sh')
install='android-pkg-config.install'
md5sums=('SKIP')

_architectures="aarch64 armv7a-eabi x86 x86-64"

build() {
    for _arch in ${_architectures}; do
        sed "s|@TRIPLE@|${_arch}|g" android-pkgconfig.sh > android-${_arch}-pkg-config
    done
}

package() {
    # This indeed has to go to the "normal" directory tree
    install -d ${pkgdir}/usr/bin

    for _arch in ${_architectures}; do
        install -m755 android-${_arch}-pkg-config  ${pkgdir}/usr/bin
    done
}
