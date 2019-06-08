# Maintainer: Pawel Mizio <miziakmwa at gmail dot com>

pkgname=miniongg
pkgver=3.0.5
pkgrel=1
pkgdesc="Elder Scrolls Online and World od Warcraft AddOn Manager"
arch=('i686' 'x86_64')
url='https://minion.mmoui.com/'
license=('Minion EULA')
depends=('jdk8-openjdk' 'java-openjfx' 'unzip')
provides=("miniongg")
source=("https://cdn.mmoui.com/minion/v3/Minion${pkgver}-java.zip")
sha256sums=('0098613cce6e3b99decc45e6ecf6b71c4b8eed7fe0cd991611d6df5a7093bc1b')

_jvmdir=usr/lib/jvm/java-${_majorver}-openjdk

package() {
	mkdir -p "${pkgdir}/opt/Minion/"
	cp -r "${srcdir}/lib" "${pkgdir}/opt/Minion/"
	cp -r "${srcdir}/Minion-jfx.jar" "${pkgdir}/opt/Minion/"

	for _size in "32" "64" "128" "256" "512"
	do
		mkdir -p "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps"
		unzip -p Minion-jfx.jar "gg/minion/image/minion-${_size}.png" > "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/minion.png"
	done

	echo "#!/bin/sh
java -jar /opt/Minion/Minion-jfx.jar" > miniongg
	install -D "${srcdir}/miniongg" "${pkgdir}/usr/bin/miniongg"

	echo "[Desktop Entry]
Version=1.0
Name=Minion
GenericName=Addons Manager
Comment=Manage games Addons
Keywords=Internet;Games;
Exec=miniongg
Icon=minion
Terminal=false
X-MultipleArgs=false
Type=Application
StartupNotify=true
StartupWMClass=Minion
Categories=Network;Games;" > minion.desktop
	mkdir -p "${pkgdir}/usr/share/applications"
	install -m644 "${srcdir}/minion.desktop" "${pkgdir}/usr/share/applications/"
}

sha256sums=('0098613cce6e3b99decc45e6ecf6b71c4b8eed7fe0cd991611d6df5a7093bc1b')
