# Contributor: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=adspower-global
pkgver=6.2.29
pkgrel=1
pkgdesc="Protect your accounts, see the revenue growth."
arch=(x86_64)
url="https://www.adspower.com"
license=('custom')
depends=(
	gcc-libs
	glibc
	bash
	electron
	hicolor-icon-theme
)
source=(
	https://version.adspower.net/software/linux-x64-global/AdsPower-Global-$pkgver-x64.deb)
sha256sums=('c194a1a89a8de0ddf5f56cef0aa6079d40cabc5b52d4e04ef54533be813758d1')

package() {
	bsdtar -xf data.tar.* -C $pkgdir
	find $pkgdir/opt -not -path "*/resources/*" -type f -delete -print
	find $pkgdir -name "*armv8*" -delete -print
	find "$pkgdir" -type d -empty -delete
	printf "#!/bin/sh
exec electron /opt/AdsPower\ Global/resources/app.asar \"\$@\"
" | install -Dm755 /dev/stdin "$pkgdir/opt/AdsPower Global/adspower_global"
}
