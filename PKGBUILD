# Maintainer: Lorenzo Zolfanelli <dev(at)zolfa(dot)nl>

pkgname=thinkpad-em05-g-fcc-unlock

# I do not know how lenovo intends on versioning this, hopefully it's sane
pkgver=1.0
pkgrel=1

pkgdesc='FCC Unlocking tool for the Quectel EM05-G in ThinkPad notebooks'
arch=('x86_64')
license=('LGPL-2.0-or-later')
depends=('modemmanager')
url='https://gitlab.freedesktop.org/mobile-broadband/ModemManager'
conflicts=()
install="${pkgname}.install"
makedepends=("git")
source=()

package() {
	pids=('6008' '0313' '0314')
	mkdir -p "$pkgdir/usr/share/ModemManager/fcc-unlock.available.d"
	cd "$pkgdir/usr/share/ModemManager/fcc-unlock.available.d"
	for pid in "${pids[@]}"; do
    		ln -s 2c7c "2c7c:$pid"
    	done

	mkdir -p "$pkgdir/usr/lib/ModemManager/fcc-unlock.d"
	for pid in "${pids[@]}"; do
    		ln -sft "$pkgdir/usr/lib/ModemManager/fcc-unlock.d" "/usr/share/ModemManager/fcc-unlock.available.d/2c7c:$pid"
	done
}

