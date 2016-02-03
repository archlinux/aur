# Maintainer: Claudio d'Angelis <claudiodangelis at gmail dot com>
pkgname=toggl-bin
pkgver=7.3.247
pkgrel=8
pkgdesc="Free Time Tracking Software which is insanely easy to use. (Unofficial Binary)"
arch=('x86_64')
url="https://toggl.com"
license=('BSD')
install=${pkgname}.install
source=("https://github.com/toggl/toggldesktop/releases/download/v7.3.247/toggldesktop_linux_x86_64-7_3_247.tar.gz"
"toggl.desktop" "TogglDesktop.sh")
md5sums=("928f8e6d1cc25b4fe6e3d0b7c653161c"
		 "8c12ccdabee1dac4d6bec24cc5b9f5d5"
		 "9b04cfe4447c0da00d78ad09f44fad1f")

package() {
	cd "${srcdir}"
	install -dm755 "${pkgdir}/opt/"
	chmod -R 755 "toggldesktop"
	cp "TogglDesktop.sh" "toggldesktop/TogglDesktop.sh"
	chmod +x "toggldesktop/TogglDesktop.sh"
	cp -r "toggldesktop" "${pkgdir}/opt/toggldesktop"
	chmod -R 755 "toggldesktop"
	for res in 1024x1024 256x256 128x128 96x96 64x64 48x48 32x32 24x24 16x16; do
    	install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
    	ln -s "/opt/toggldesktop/icons/${res}/toggldesktop.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/toggldesktop.png"
  	done
    # Fixing permissions
    chmod -R 755 "/opt/toggldesktop"
  	install -dm755 "${pkgdir}/usr/share/applications"
  	install -Dm644 "toggl.desktop" "${pkgdir}/usr/share/applications/toggl.desktop"

  	install -dm755 "${pkgdir}/usr/bin"
  	ln -s "/opt/toggldesktop/TogglDesktop.sh" "${pkgdir}/usr/bin/toggl"
}
