# Maintainer: Kimiblock Zhou <kimiblock at icloud dot com>
pkgname=bili-you-bin
pkgver=1.1.5+15
pkgrel=3
epoch=
pkgdesc="一个用flutter制作的第三方B站客户端."
arch=('x86_64')
url="https://github.com/lucinhu/bili_you"
license=('apache')
groups=()
depends=('gtk3' 'mpv')
makedepends=('fuse' 'imagemagick')
checkdepends=()
optdepends=()
provides=(bili-you-bin)
conflicts=(bili-you-bin)
replaces=()
source=(
	bili-you-${pkgver}.AppImage::'https://github.com/lucinhu/bili_you/releases/latest/download/BiliYou-x86_64.AppImage'
)
noextract=()
md5sums=(
	'SKIP'
)
validpgpkeys=()
function package() {
	mkdir -p "${pkgdir}"/usr/share/applications
	mkdir -p "${pkgdir}"/usr/share/icons/hicolor/512x512/apps
	mkdir -p "${pkgdir}"/usr/bin
	info 'Extracting AppImage...'
	cd ${srcdir}
	chmod +x "${srcdir}"/bili-you-${pkgver}.AppImage
	"${srcdir}"/bili-you-${pkgver}.AppImage --appimage-extract
	echo '''[Desktop Entry]
Categories=AudioVideo;
Comment[zh_CN]=一个用flutter制作的第三方B站客户端
Comment=Third party Bilibili client.
Exec=/usr/bin/bili_you
Icon=bili
Name[zh_CN]=BiliYou
Name=BiliYou
Terminal=false
Type=Application''' >"${pkgdir}"/usr/share/applications/bili_you.desktop
	cp -r "${srcdir}"/squashfs-root/opt "${pkgdir}"/
	convert "${pkgdir}"/opt/data/flutter_assets/assets/icon/bili.png -resize 512x512 "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/bili.png
	ln -s /opt/bili_you "${pkgdir}"/usr/bin/bili_you
	chmod 755 "${pkgdir}"/ -R
}

function info() {
	if [ -f /usr/bin/pamac ]; then
		echo "  ==> [Info]: $@"
	else
		all_off="$(tput sgr0)"
		bold="${all_off}$(tput bold)"
		blue="${bold}$(tput setaf 4)"
		yellow="${bold}$(tput setaf 3)"
		printf "${blue}==>${yellow} [Info]:${bold} $1${all_off}\n"
	fi
}
