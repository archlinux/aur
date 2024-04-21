# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

_android_arch=aarch64

pkgname=android-${_android_arch}-alsa-topology-conf
pkgver=1.2.5.1
pkgrel=1
arch=('any')
pkgdesc="ALSA topology configuration files (Android ${_android_arch})"
url="https://alsa-project.org/"
license=('BSD')
depends=('android-ndk')
makedepends=('android-environment')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://www.alsa-project.org/files/pub/lib/alsa-topology-conf-$pkgver.tar.bz2")
md5sums=('066d6a980e09a2fa44b4cc1d06ecc0ea')

build() {
    cd "${srcdir}/alsa-topology-conf-$pkgver"
}

package() {
    cd "${srcdir}/alsa-topology-conf-$pkgver"
    source android-env ${_android_arch}

    for dir in topology/*; do
        install -vDm 644 "$dir"/*.conf -t "$pkgdir/${ANDROID_PREFIX_SHARE}/alsa/topology/$(basename $dir)"
    done
}
