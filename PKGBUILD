# Maintainer: Matthias Gatto <uso.cosmo.ray at gmail dot com>

pkgname=little-space-git
pkgver=r15.49ca64d
pkgrel=1
pkgdesc="Small Shoot'em UP"


arch=('any')

url='https://github.com/cosmo-ray/little-space/tree/little-space'

licence=(LGPL3)

pkgver() {
	 cd "${srcdir}/little-space"
	 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

depends=(yirl-git)

#default branch is little mage, another game using he same engine
#but scale for desktop screen
source=(git+https://github.com/cosmo-ray/little-space.git#branch=little-space)
sha256sums=("SKIP")

build() {
	 cd "${srcdir}/little-space"
}

package() {
	 cd "${srcdir}/little-space"
	 mkdir -p "$pkgdir/usr/share/little-space"
	 cp -rv * "$pkgdir/usr/share/little-space/"
	 mkdir -p "$pkgdir/usr/bin/"
	 echo "#!/bin/sh" > "$pkgdir/usr/bin/little-space"
	 echo "yirl-loader --binary-root-path /usr/share/yirl/ -d /usr/share/little-space/ -L -W 400 -H 600" >> "$pkgdir/usr/bin/little-space"
	 chmod +x "$pkgdir/usr/bin/little-space"
	 mkdir -p "$pkgdir/usr/share/applications"
	 cp little-space.desktop "$pkgdir/usr/share/applications/"
}
