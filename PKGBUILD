# Maintainer: john <aur {at} jbrengineering {dot} co {dot} uk>

pkgname=arduino-samd-core
pkgver=1.6.16
pkgrel=2
pkgdesc="Arduino support for SAMD21 series ARM 32 bit microcontrollers (used on Arduino M0 Pro, MKR1000, Arduino Zero etc.)"
arch=('any')
url="https://github.com/arduino/ArduinoCore-samd"
license=('GPL')
depends=('arm-none-eabi-gcc' 
         'openocd')
makedepends=('')
optdepends=('arduino: Arduino IDE: IDE'
            'avrdude: M0 uploading support'
            'bossa: Zero uploading support')
options=(!strip)
source=("https://github.com/arduino/ArduinoCore-samd/archive/1.6.16.tar.gz"
        "https://downloads.arduino.cc/CMSIS-4.5.0.tar.bz2"
        "https://downloads.arduino.cc/CMSIS-Atmel-1.0.0.tar.bz2"
        "platform.patch")
sha512sums=('598328e828163c2a44d8ac97e627de6fd0451b548dde11b41d97b4d0e3f5e5604d96fba272c7ac601b233c1999e47a2cd04f089acfb0e024a6229672e36cde53'
            '97af9c847c0fec6abfe4769910351f1d85aa19d09b4eea88a3852b3d3f196c7f02b16e0fc9686bcff3d94f8cfae512ab7e550f8fa1abb8db87da7e95c56f5502'
            'e7286a162f63c0de23db684ebe58b79aade01c47f522b52838cb6adc937daa8a4403de9fdca69c9bae855e27d840843814874b7b18a1b0d360553057f28cd0fc'
            'ffba11449577f8a7951672725504fd637e5e5a563bfe17ec39cfb6d973c41610a63bb0e8b71d2a6fefe88be169d9dec0dcca281866468738d90cfb712bcc1f68')

prepare()
{
    # Prepare arduino samd core to be used with internal toolchains
    cd "${srcdir}/ArduinoCore-samd-1.6.16"
    patch -Np1 -i "${srcdir}/platform.patch"
}

package() {
    # Copy to archlinux arduino folder, within the packages sub directory structured as Arduino IDE
    install -dm755 "${pkgdir}/usr/share/arduino/packages/arduino/hardware/samd"
    install -dm755 "${pkgdir}/usr/share/arduino/packages/arduino/tools/CMSIS/4.5.0/"
    install -dm755 "${pkgdir}/usr/share/arduino/packages/arduino/tools/CMSIS-Atmel/1.0.0/"
    cp -a "${srcdir}/ArduinoCore-samd-1.6.16/"* "${pkgdir}/usr/share/arduino/packages/arduino/hardware/samd"
    cp -a "${srcdir}/CMSIS/"* "${pkgdir}/usr/share/arduino/packages/arduino/tools/CMSIS/4.5.0/"
    cp -a "${srcdir}/CMSIS-Atmel/"* "${pkgdir}/usr/share/arduino/packages/arduino/tools/CMSIS-Atmel/1.0.0/"
}
