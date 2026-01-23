# Maintainer: A43 <arirera43 [at] gmail [dot] com>

pkgname="mxw-udev"
pkgdesc='Rootless configuration and reporting for the mow and mxw Glorious Core v1 alternatives'
pkgver=v2
pkgrel=1
arch=('any')
url="https://github.com/korkje/mow/issues/1#issuecomment-1073065854"
install=${pkgname}.install

build() {
	cat > $srcdir/70-glorious-mxw.rules <<'EOF' 
# Allow `mow` and `mxw` to communicate with wireless Glorious mice without privelige escalation (sudo)
# `mow` does not work in some cases even with this udev rule. Use `mxw` instead if you experience issues. 
# Based on https://github.com/libusb/hidapi/blob/master/udev/69-hid.rules
# At the recommendation of https://github.com/korkje/mow/issues/1#issuecomment-1073065854

# USB IDs are sourced from https://github.com/dkbednarczyk/mxw/raw/refs/heads/master/src/glorious.rs

# HIDAPI/hidraw
# TAG+="uaccess" only gives permission to physically present users
# Model O Wireless 	(Wireless, Wired)
KERNEL=="hidraw*", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2022", TAG+="uaccess"
KERNEL=="hidraw*", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2011", TAG+="uaccess"

# Model O- Wireless 	(Wireless, Wired)
KERNEL=="hidraw*", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2013", TAG+="uaccess"
KERNEL=="hidraw*", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2024", TAG+="uaccess"

# Model O PRO 		(Wireless, Wired)
KERNEL=="hidraw*", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2027", TAG+="uaccess"
KERNEL=="hidraw*", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2015", TAG+="uaccess"

# Model D Wireless 	(Wireless, Wired)
KERNEL=="hidraw*", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2023", TAG+="uaccess"
KERNEL=="hidraw*", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2012", TAG+="uaccess"

# Model D- Wireless 	(Wireless, ~~Wired?~~)
KERNEL=="hidraw*", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2025", TAG+="uaccess"
# Wired ID guessed, please contribute the wired USB ID to dkbednarczyk/mxw on GitHub if you have a Model D- and mention @ari-43 (me) to update this package. 
#KERNEL=="hidraw*", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2014", TAG+="uaccess"

Model D2 PRO 		(Wireless)
KERNEL=="hidraw*", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2034", TAG+="uaccess"

Series 1 PRO 		(Wireless)
KERNEL=="hidraw*", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2018", TAG+="uaccess"
EOF
}

package() {
  install -Dm644 \
	$srcdir/70-glorious-mxw.rules \
	-t $pkgdir/usr/lib/udev/rules.d/
}
