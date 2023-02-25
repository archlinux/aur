# Maintainer: ghesy <ehsan at disroot dot org>

pkgname=odin4-cli
pkgver=1.2.1.dc05e3ea0
pkgrel=1

pkgdesc="an Odin4 binary for flashing Samsung firmware"
url='https://forum.xda-developers.com/t/official-samsung-odin-v4-1-2-1-dc05e3ea-for-linux.4453423/'

arch=('x86_64')
license=('custom:Samsung')

depends=('glibc')
source=("${pkgname}-${pkgver}.zip::https://web.archive.org/web/20230225072710if_/https://forum.xda-developers.com/attachments/odin-zip.5629297/")
sha256sums=('d918f132b0b2ee5cbeef27fb61f6aeee3734cdb202b2dc8e3845a955303002c5')

# don't modify prebuilt binaries
options=('!strip')

prepare()
{
	# extract the license text from the odin4 binary
	_sep='__SEPARATOR__'
	strings --include-all-whitespace --output-separator "$_sep" odin4 |
		awk -v RS="$_sep" '$0 ~ /\<Copyright\>.*\<Samsung\>/ {print $0}' \
		> LICENSE.txt
}

package()
{
	install -Dm755 odin4         -t "${pkgdir}/usr/bin/"
	install -Dm644 LICENSE.txt   -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
