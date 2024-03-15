pkgname=android-configure
pkgver=2
pkgrel=2
arch=(any)
pkgdesc="configure wrapper for Android (android)"
depends=('android-environment' 'android-pkg-config')
license=("GPL")
url="https://aur.archlinux.org/packages/android-configure"
source=("android-configure.sh")
md5sums=('d26b9335ae85d8063592dad0419335f7')

_architectures="aarch64 armv7a-eabi x86 x86-64"

build() {
    for _arch in ${_architectures}; do
        sed "s|@TRIPLE@|${_arch}|g" android-configure.sh > android-${_arch}-configure
    done
}

package() {
    install -d "${pkgdir}"/usr/bin

    for _arch in ${_architectures}; do
        install -m 755 android-${_arch}-configure "${pkgdir}"/usr/bin/
    done
}
