# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=arduino-avr-core
pkgver=1.6.14
pkgrel=3
pkgdesc="Arduino AVR core with upstream avr-gcc and avrdude"
arch=('any')
url="https://github.com/arduino/Arduino"
license=('GPL')
depends=('avrdude' 'avr-gcc' 'avr-libc')
makedepends=('')
optdepends=('arduino: Arduino IDE')
options=(!strip)
source=("https://downloads.arduino.cc/cores/avr-1.6.14.tar.bz2"
        "platform.patch")
sha512sums=('06fff5e62ffa6d3d2b11c75fd54fafe689f8d3fbc6ea38ceb14389ace8f0720a6ba0bd29c6ee6096075fb287bb91fa635533e92904f098c55854be438f6f1514'
            '8c1b21222bd65d7985a71f6ac037aa69a608e99fe633528f9161ac39d57329499fd32cd8ff0021e15dc2239612edde8cded1a22882f46dc6433388eabc9f24c2')

prepare()
{
    # Prepare arduino avr core to be used with internal avr-gcc
    cd "${srcdir}/avr"
    patch -Np1 -i "${srcdir}/platform.patch"

    # Remove elf files
    find . -name "*.elf" -type f -exec rm -f {} \;
    find . -name "*.a" -type f -exec rm -f {} \;
}

package() {
    # Copy archlinux arduino avr core
    install -dm755 "${pkgdir}/usr/share/arduino/hardware/archlinux-arduino"
    cp -a "${srcdir}/avr" "${pkgdir}/usr/share/arduino/hardware/archlinux-arduino"
}
