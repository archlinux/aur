# Maintainer: Brodi <me@brodi.space>
pkgname=obs-rtspserver-bin
pkgver=1.1.1
_obsver=24.0.0
pkgrel=1
pkgdesc="RTSP server plugin for obs-studio"
arch=("x86_64")
url="https://github.com/iamscottxu/obs-rtspserver"
license=('GPL')
depends=('obs-studio')
source=("https://github.com/iamscottxu/obs-rtspserver/releases/download/v${pkgver}/obs-rtspserver-v${pkgver}-linux.tar.gz"
	"https://raw.githubusercontent.com/iamscottxu/obs-rtspserver/master/LICENSE")
md5sums=('833054b95e46af518e219e4504c34fec'
	 'SKIP')

build() {
	if [ -d "$HOME/.config/obs-studio/plugins/" ]; then
    		echo "[+] The OBS-Studio plugin folder exists. ($HOME/.config/obs-studio/plugins/)"
	else
		echo "[-] The OBS-Studio plugin folder DOES NOT exist!"
		echo "[*] Creating the OBS-Studio plugin folder.... ($HOME/.config/obs-studio/plugins/)"
		mkdir -p "$HOME/.config/obs-studio/plugins/"
		mkdir -p "$HOME/.config/obs-studio/plugins/obs-rtspserver/"
		mkdir -p "$HOME/.config/obs-studio/plugins/obs-rtspserver/bin/64bit/"
		mkdir -p "$HOME/.config/obs-studio/plugins/obs-rtspserver/data/locale/"
	fi
}

package() {
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"	
	install -dm755 obs-rtspserver $HOME/.config/obs-studio/plugins/
}

post_remove() {
	if [ -d "$HOME/.config/obs-studio/plugins/obs-rtspserver/" ]; then
                echo "[*] The obs-rtspserver plugin folder exists. ($HOME/.config/obs-studio/plugins/obs-rtspserver)"
                echo "[*] Removing obs-rtspserver folder.... ($HOME/.config/obs-studio/plugins/obs-rtspserver/)"
		rm -rf $HOME/.config/obs-studio/plugins/obs-rtspserver/
        fi

}
