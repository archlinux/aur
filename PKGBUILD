# Contributor: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: zhuangzhuang <xufengyuan20080802@outlook.com>
pkgname="rubick-electron-bin"
pkgver=2.2.7
pkgrel=1
pkgdesc="Electron based open source toolbox, free integration of rich plug-ins. 基于 electron 的开源工具箱，自由集成丰富插件。"
arch=('x86_64')
url="https://rubickcenter.github.io/rubick/"
_githuburl="https://github.com/rubickCenter/rubick"
license=('MIT')
depends=('electron13' 'bash')
optdepends=('libappindicator-gtk3')
provides=("rubick2")
conflicts=("rubick" rubick-bin)
options=()
install=
source=("rubick-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/rubick_${pkgver}_amd64.deb"
	"LICENSE::https://raw.githubusercontent.com/rubickCenter/rubick/master/LICENSE")
sha256sums=('a2b3d8addfb344c65ad3afd6989147c16022ddf6597222ddcb9ae2fe48dc82d1'
	'98ec3482acc93db8661b6a794744e5eaca088cf75312d15f196abb5db7e52b77')

package() {
	bsdtar -xf data.tar.xz -C "${pkgdir}"
	find $pkgdir/opt -type f -not -name "app.asar" -exec rm -vrf {} \;
	install -Dm755 /dev/null $pkgdir/usr/bin/rubick2
	echo "#!/bin/bash" >$pkgdir/usr/bin/rubick2
	echo "electron13 /opt/rubick2/resources/app.asar" >>$pkgdir/usr/bin/rubick2
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
	sed -i -r 's!Exec=.*?!Exec=rubick2!g' $pkgdir/usr/share/applications/rubick.desktop
}
