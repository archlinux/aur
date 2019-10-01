# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=guiscrcpy-git
pkgver=1.11.r19.d112ac4
pkgrel=1
pkgdesc="A full fledged GUI integration for the most award winning open-source Android screen mirroring system -- scrcpy"
arch=('i686' 'x86_64')
url="https://srevinsaju.github.io/guiscrcpy"
license=('GPL3')
depends=('scrcpy' 'python-pyqt5' 'python-psutil' 'python-qdarkstyle')
makedepends=('git')
optdepends=('python-pystray: for developers'
            'usbaudio: AOA audio, deprecated since Android 8.0')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/srevinsaju/guiscrcpy.git'
        "${pkgname%-git}.desktop"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            'b9f2925be19119950b8fa5099ff81c7368e51f1973d6f2528abe702087e6e5e0'
            '21a9e0f6a38db03cbe84d6498519bd79d66796f47cd6a738133f38a45ea4bb42')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -d "$pkgdir/opt/${pkgname%-git}"
	cp -r "${pkgname%-git}/"* "$pkgdir/opt/${pkgname%-git}/"
	install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 "$srcdir/${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
	install -Dm644 "installers/linux/icons/${pkgname%-git}_logo.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
}
