# Maintainer : Yamada Hayao <hayao@fascode.net>
# Contributer: David Mazieres (http://www.scs.stanford.edu/~dm/addr/)

_pkgname="droidcam-obs-plugin"
pkgname="${_pkgname}-bin"
pkgver="2.3.3"
pkgrel="1"
pkgdesc="Plugin for DroidCam OBS"
arch=("x86_64" "i686")
url="https://droidcam.app/"
license=('GPL')
depends=("obs-studio" 'libusbmuxd' 'ffmpeg')
makedepends=('libjpeg-turbo')
conflicts=("${_pkgname}-git")
source=("https://github.com/dev47apps/droidcam-obs-plugin/releases/download/${pkgver}/droidcam_obs_${pkgver}_linux_flatpak.zip")
sha256sums=('631ce154ffb74483e06bf87bd31a3e676b35ddf649a9b19ababc47ace0ec05e5')

package() {
	set -e
	OK=0
	DIRS="
	$HOME/.config/obs-studio
	$HOME/snap/obs-studio/current/.config/obs-studio
	$HOME/.var/app/com.obsproject.Studio/config/obs-studio
	"

	for dir in $DIRS; do
		if [ -d $dir ]; then
			set -x
			mkdir -p "${dir}/plugins/"
			cp -R droidcam-obs "${dir}/plugins/"
			set +x
			OK=1
		fi
	done

	if [ $OK == 0 ]; then
		echo "OBS Studio config folder not found!"
		echo "Checked:${DIRS}"
		exit 1
	fi
	echo "Done"
}
