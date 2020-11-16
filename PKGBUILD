# Maintainer: yjun <jerrysteve1101@gmail.com>
# Contributor: Sosthène Guédon <sosthene.gued@gmail.com>

_prefix=arm-linux-gnueabi
pkgname=${_prefix}-gcc75-linaro-bin
_pkgname=${pkgname%-bin}
_date='2019.12'
pkgver=7.5.0
pkgrel=1
pkgdesc="	The GNU Compiler Collection - cross compiler for ARM target"
arch=('x86_64')
url="https://www.linaro.org/downloads/"
license=('GPL')
conflicts=('arm-linux-gnueabihf-gcc' 'arm-linux-gnueabihf-binutils')
options=(!strip)
_filename="gcc-linaro-${pkgver}-${_date}-x86_64_${_prefix}"
source=("$pkgname-$pkgver.tar.xz::https://releases.linaro.org/components/toolchain/binaries/latest-7/${_prefix}/${_filename}.tar.xz")
sha256sums=('dda99cf2fc0a8b6d54440121c47645ab0b4dc921cc2d24f88707ea9741adc933')

package() {
    cd $_filename

    mkdir -p "$pkgdir"/opt/${_pkgname}/

    cp -r ${_prefix} ${pkgdir}/opt/${_pkgname}/
    cp -r bin ${pkgdir}/opt/${_pkgname}/
    cp -r include ${pkgdir}/opt/${_pkgname}/
    cp -r lib ${pkgdir}/opt/${_pkgname}/
    cp -r libexec ${pkgdir}/opt/${_pkgname}/
    cp -r share ${pkgdir}/opt/${_pkgname}/
    
    install -dm755 ${pkgdir}/usr/bin
    for bin in ${pkgdir}/opt/${_pkgname}/bin/*;
    do
        ln -sf /opt/${_pkgname}/bin/$(basename ${bin}) ${pkgdir}/usr/bin/$(basename ${bin})
    done
}

# vim: set sw=2 ts=2 et:
