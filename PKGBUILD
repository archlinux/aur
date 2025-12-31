# Maintainer: A43 <arirera43 [at] gmail [dot] com>

pkgname="mxw-udev"
pkgdesc='Rootless configuration and reporting for the mow and mxw Glorious Core v1 alternatives'
pkgver=v1
pkgrel=1
arch=('any')
url="https://github.com/korkje/mow/issues/1#issuecomment-1073065854"
install=${pkgname}.install

build() {
	cat > $srcdir/70-glorious-mxw.rules <<'EOF' 
# Allow `mow` and `mxw` to communicate with wireless Glorious mice without privelige escalation (sudo)
# Based on https://github.com/libusb/hidapi/blob/master/udev/69-hid.rules
# At the recommendation of https://github.com/korkje/mow/issues/1#issuecomment-1073065854

# HIDAPI/hidraw
# TAG+="uaccess" only gives permission to physically present users
KERNEL=="hidraw*", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2011", TAG+="uaccess"
KERNEL=="hidraw*", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2022", TAG+="uaccess"
EOF
}

package() {
  install -Dm644 \
	$srcdir/70-glorious-mxw.rules \
	-t $pkgdir/usr/lib/udev/rules.d/
}
