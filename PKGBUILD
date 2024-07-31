# maintainer: username227 { gfrank227 [at] gmail [dot] com }
pkgname=watchit-appimage
_pkgname=watchit
_pkgver=1.0.0-beta.0
pkgver=1.0.0.beta.0
pkgrel=2
arch=('x86_64')
pkgdesc='WatchIt is a movie playback system that allows users to filter, search, and play movies.'
url='https://github.com/WatchItDev/watchit-app'
license=('AGPL-3.0')
depends=("hicolor-icon-theme")
source=("watchit-${_pkgver}::https://github.com/WatchItDev/watchit-app/releases/download/v${_pkgver}/watchit-${_pkgver}.AppImage"
	"https://github.com/WatchItDev/watchit-app/releases/download/v$_pkgver/watchit_${_pkgver}_amd64.deb"
	"desktoppatch.patch")
sha256sums=('d2bab55cd99a1db456d9921b77f9fa809a498bf4b1cb1e4d90f907332d2cefcb'
            'ea7763256bda3b3805f1024130db7d53f4a23e82121b384af02333e99054aef8'
            '426706b37c7f96eb0f4e3a5c20ae28a8c92101025e9efd6a4178775286a8f2af')
options=('!strip')
prepare() {
ar xv $srcdir/watchit_${_pkgver}_amd64.deb
tar -xf $srcdir/data.tar.xz
patch -p1 -o $srcdir/watchit.desktop $srcdir/./usr/share/applications/watchit.desktop $srcdir/desktoppatch.patch
}
package() {
install -dm755 $pkgdir/usr/bin
install -dm755 $pkgdir/usr/share/applications
install -dm644 $pkgdir/usr/share/icons/hicolor/256x256/apps
install -Dm644 $srcdir/./usr/share/icons/hicolor/256x256/apps/watchit.png -t $pkgdir/usr/share/icons/hicolor/256x256/apps
install -Dm755 $srcdir/watchit.desktop -t $pkgdir/usr/share/applications
install -Dm755 $srcdir/watchit-${_pkgver} $pkgdir/usr/bin/watchit
}

