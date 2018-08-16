pkgname=devrantron
_pkgname=devrantron
pkgver=1.5.4
pkgrel=1
pkgdesc='DevRant client written in ReactJS'
arch=('x86_64')
url='https://github.com/tahnik/devrantron'
license=('Apache 2.0')
depends=('gconf' 'libnotify' 'libappindicator-gtk3' 'libxtst' 'nss' 'libxss')
makedepends=('wget' 'jq' 'binutils' 'tar' 'xz')
source=('https://api.github.com/repos/tahnik/devrantron/releases/latest')
provides=($_pkgname)
sha1sums=('SKIP')

pkgver() {
	cat latest|jq --raw-output '.tag_name'|sed 's/v//g'
}

build() {
	if [ ! -f package.deb ]
	then	
		wget $(cat latest | jq --raw-output '.assets[7] | .browser_download_url') -O package.deb
	fi	
	ar x package.deb
	tar xf data.tar.xz
}

package() {
	mkdir -p ${pkgdir}/opt/devRantron
	cp -rf opt/devRantron							${pkgdir}/opt/
	install -m 755 -d opt/devRantron					${pkgdir}/opt/
	install -Dm644 usr/share/applications/devrantron.desktop 		${pkgdir}/usr/share/applications/devrantron.desktop 
	install -Dm644 usr/share/doc/devrantron/changelog.gz			${pkgdir}/usr/share/doc/devrantron/changelog.gz
	install -Dm644 usr/share/icons/hicolor/128x128/apps/devrantron.png	${pkgdir}/usr/share/icons/hicolor/128x128/apps/devrantron.png
	install -Dm644 usr/share/icons/hicolor/16x16/apps/devrantron.png	${pkgdir}/usr/share/icons/hicolor/16x16/apps/devrantron.png
	install -Dm644 usr/share/icons/hicolor/256x256/apps/devrantron.png	${pkgdir}/usr/share/icons/hicolor/256x256/apps/devrantron.png
	install -Dm644 usr/share/icons/hicolor/32x32/apps/devrantron.png	${pkgdir}/usr/share/icons/hicolor/32x32/apps/devrantron.png
	install -Dm644 usr/share/icons/hicolor/48x48/apps/devrantron.png	${pkgdir}/usr/share/icons/hicolor/48x48/apps/devrantron.png
	install -Dm644 usr/share/icons/hicolor/512x512/apps/devrantron.png	${pkgdir}/usr/share/icons/hicolor/512x512/apps/devrantron.png
	install -Dm644 usr/share/icons/hicolor/64x64/apps/devrantron.png	${pkgdir}/usr/share/icons/hicolor/64x64/apps/devrantron.png
}


