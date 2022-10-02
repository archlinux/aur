# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

# The 'sam' hardware port is not included here yet as I have
# no hardware to test it on. I dare say it would just work
# so if somebody wants to try it and let me know...

pkgbase=arduino-noide
pkgname=('arduino-noide-libs' 'arduino-noide-avr')
pkgdesc="Arduino prototyping platform without the IDE"
pkgver=1.8.19
pkgrel=1
arch=('any')
url="http://arduino.cc/en/Main/Software"
conflicts=('arduino' 'arduino10')
license=('GPL' 'LGPL')
source=('https://github.com/arduino/Arduino/archive/1.6.8.zip')
sha256sums=('786428ff0e20e033e78108d289d090f9ecade43314c3a4bf4668089cd3e02fe0')
options+=(!strip)

package_arduino-noide-libs() {
	pkgdesc="Arduino prototyping platform: software libraries"

	cd "$srcdir/Arduino-1.6.8"
	install -dm755 "$pkgdir/usr/share/arduino"
	cp -a libraries "$pkgdir/usr/share/arduino"
	
	# This is just a copy of the hardware/arduino/avr/firmwares/wifishield
	# directory, so no point in repeating it.
	rm -rf "$pkgdir/usr/share/arduino/libraries/WiFi/extras/"
}

package_arduino-noide-avr() {
	pkgdesc="Arduino prototyping platform: AVR hardware support"

	cd "$srcdir/Arduino-1.6.8"
	install -dm755 "$pkgdir/usr/share/arduino/hardware/arduino"
	cp -a hardware/arduino/avr "$pkgdir/usr/share/arduino/hardware/arduino"

	# This is a simple script which only runs various make commands,
	# so there's no real need to depend on bash for it.
	sed -i '1c\#!/bin/sh' "$pkgdir/usr/share/arduino/hardware/arduino/avr/bootloaders/optiboot/makeall"
}
