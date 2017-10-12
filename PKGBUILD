# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=arduino-sam-core
pkgver=1.6.11
pkgrel=1
pkgdesc="Arduino SAM core for arduino Due"
arch=('any')
url="https://github.com/arduino/Arduino"
license=('GPL')
depends=()
optdepends=(
	'bossa: uploading support'
	'arm-none-eabi-gcc: compilation support'
)
options=(!strip !emptydirs)
source=(
	"https://downloads.arduino.cc/cores/sam-${pkgver}.tar.bz2"
)
sha512sums=(
	'6aa8c324c723e2aeadf4cd5b86bfc90fc51684982801741d6416376583f4a7a0f4f2f02637c062f1df2052ccb7846127d36e0dd922562b78d8309b079bdce370'
)
validpgpkeys=('326567C1C6B288DF32CB061A95FA6F43E21188C4') # Arduino Packages <support@arduino.cc>

prepare()
{
    # Prepare arduino avr core to be used with internal avr-gcc
    cd "${srcdir}/sam"

    # Remove elf files
    find . -name "*.elf" -type f -exec rm -f {} \;
    find . -name "*.a" -type f -exec rm -f {} \;
}

package() {
    # Copy archlinux arduino avr core
    install -dm755 "${pkgdir}/usr/share/arduino/hardware/archlinux-arduino"
    cp -a "${srcdir}/sam" "${pkgdir}/usr/share/arduino/hardware/archlinux-arduino"
}
