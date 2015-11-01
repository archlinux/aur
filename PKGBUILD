# Maintainer: Psyringe <psyringe@protonmail.com>
pkgname=toggl-bin
pkgver=7.2.66
pkgrel=7
pkgdesc="Free Time Tracking Software which is insanely easy to use. (Unofficial Binary)"
arch=('x86_64')
url="https://toggl.com"
license=('BSD')
install=${pkgname}.install
source=("https://assets.toggl.com/installers//toggldesktop_x86_64-7_2_66-2015-04-28-10-25-02.tar.gz"
"toggl.desktop")
md5sums=("355d9623b09fdc5773199927021e45a4"
		 "e94844089a6c2b911c6286b7a1f1f519")

package() {
	cd "${srcdir}"
	install -dm755 "${pkgdir}/opt/"
	cp -r "toggldesktop" "${pkgdir}/opt/toggldesktop"

	for res in 1024x1024 256x256 128x128 96x96 64x64 48x48 32x32 24x24 16x16; do
    	install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
    	ln -s "/opt/toggldesktop/icons/${res}/toggldesktop.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/toggldesktop.png"
  	done

  	install -dm755 "${pkgdir}/usr/share/applications"
  	install -Dm644 "toggl.desktop" "${pkgdir}/usr/share/applications/toggl.desktop"

  	install -dm755 "${pkgdir}/usr/bin"
  	ln -s "/opt/toggldesktop/TogglDesktop" "${pkgdir}/usr/bin/toggl"

  	#Double check the permissons
  	chmod 755 "${pkgdir}/opt/toggldesktop"
  	chmod 755 "${pkgdir}/usr/share/applications"
  	chmod 755 "${pkgdir}/usr/share/applications/toggl.desktop"
  	chmod 755 "${pkgdir}/usr/bin/toggl"
}
