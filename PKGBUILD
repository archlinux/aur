# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Stephen <stephenvdw.social@gmail.com>
pkgname=ytbgmplayer-git
pkgver=1.2.10.r63.03ac5e8
pkgrel=1
# epoch=
pkgdesc="A lightweight youtube background music player"
arch=(x86_64)
url="https://github.com/WeebNetsu/yt-playlist-bgm-player.git"
license=('GPL-3.0')
# groups=()
depends=(mpv yt-dlp)
makedepends=(git nim)
# checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
# below is any files we do not want to have
# touched in the case of update or delete
# like config files
backup=()
options=()
# install=
# changelog=
source=("git+$url")
noextract=()
md5sums=("SKIP")
# validpgpkeys=()

pkgver(){
	cd "${_pkgname}"
	printf "1.2.11.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	pwd
	cd yt-playlist-bgm-player
	export NIMBLE_DIR=nimble-data
	nimble build -d:release
	chmod +x ytbgmplayer
}

package() {
	cd yt-playlist-bgm-player
	mkdir -p ${pkgdir}/usr/bin
	cp -rf ytbgmplayer ${pkgdir}/usr/bin/ytbgmplayer
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	# TODO: Add readme and license https://youtu.be/iUz28vbWgVw
	echo "NOTICE: You need yt-dlp to play music from YouTube."
}
