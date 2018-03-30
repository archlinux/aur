#Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=nuvolaruntime-mse
_pkgname=nuvolaruntime
pkgver=4.10.0
pkgrel=1
pkgdesc="Nuvola Apps Runtime - Tight integration of web apps with your desktop"
arch=("any")
url=https://github.com/tiliado/nuvolaruntime/
license=('custom:BSD')
provides=('nuvolaplayer' 'nuvolaruntime')
conflicts=('nuvolaplayer' 'nuvolaruntime')
depends=('python' 'vala' 'diorite>=4.7.0' 'glib2' 'ruby-gio2' 'python-gobject2' 'gtk3' 'json-glib' 'libnotify' 'gstreamer' 'libdri2-git' 'libdrm' 'webkit2gtk-mse')
makedepends=('scour' 'dri2proto')
source=(https://github.com/tiliado/${_pkgname}/archive/${pkgver}.tar.gz)
md5sums=('910ee61c17ba9ac434f2e08d1ac8c7d5')

optdepends=(
'nuvola-app-8tracks:			8tracks integration for Nuvola Player.'
'nuvola-app-amazon-cloud-player:	amazon cloud player integration for Nuvola Player.'
'nuvola-app-bandcamp:			bandcamp integration for Nuvola Player.'
'nuvola-app-bbc-iplayer:		bbc iplayer integration for Nuvola Player.'
'nuvola-app-deezer:			deezer integration for Nuvola Player.'
'nuvola-app-google-calendar:		google calendar integration for Nuvola Player.'
'nuvola-app-google-play-music:		Google Play integration for Nuvola Player.'
'nuvola-app-groove:			groove integration for Nuvola Player.'
'nuvola-app-jango:			jango integration for Nuvola Player.'
'nuvola-app-jupiter-broadcasting:	Jupiter broadcasting integration for Nuvola Player.'
'nuvola-app-kexp:			kexp integration for Nuvola Player.'
'nuvola-app-mixcloud:			mixcloud integration for Nuvola Player.'
'nuvola-app-owncloud-music:		owncloud music integration for Nuvola Player.'
'nuvola-app-plex:			plex integration for Nuvola Player.'
'nuvola-app-pocket-casts:		pocket casts integration for Nuvola Player.'
'nuvola-app-siriusxm:			siriusxm integration for Nuvola Player.'
'nuvola-app-soundcloud:			soundcloud integration for Nuvola Player.'
'nuvola-app-spotify:			spotify integration for Nuvola Player.'
'nuvola-app-tunein:			tunein integration for Nuvola Player.'
'nuvola-app-yandex-music:		yandex music integration for Nuvola Player.'
'nuvola-app-youtube:			youtube integration for Nuvola Player.'
'nuvola-app-logitech-media-server:	Logitech Media Server integration for Nuvola Player.'
'libdbusmenu-glib:			Library for passing menus over DBus'
'libappindicator-gtk2:			Systray icon support'
'libappindicator-gtk3:                  Systray icon support'
'libappindicator-sharp:                 Systray icon support'
'engine.io-client:			Cross-browser/cross-device bi-directional communication layer for Socket.IO.'
'unit.js:				Unit testing framework for javascript / Node.js.'
)
prepare() {
cd "$srcdir/${_pkgname}-${pkgver}"
sed 's|usr/share/vala-0\.36|usr/share/vala-0.38|g' -i vapi/webkit2gtk-web-extension-4.0.patch vapi/glib-2.0.patch wscript
}
build() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    ./waf configure --prefix=/usr --nounity --libdir=/usr/lib --noappindicator --webkitgtk-supports-mse
    ./waf build
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    ./waf install --destdir=${pkgdir}
}
