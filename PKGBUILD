# Maintainer: Alleop <aur dot contest432 at passinbox dot com>
_pkgname=freetube
_electronver=34
pkgname=$_pkgname-electron-bin
pkgver=0.23.4
pkgrel=1
pkgdesc='An open source desktop YouTube player built with privacy in mind, with the system electron (unsupported).'
arch=('any')
url='https://github.com/FreeTubeApp/FreeTube'
license=('AGPL-3.0-or-later')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('freetube.sh' "$url/releases/download/v$pkgver-beta/${_pkgname}_${pkgver}_armv7l.deb"
        "https://raw.githubusercontent.com/FreeTubeApp/FreeTube/refs/tags/v$pkgver-beta/LICENSE")
b2sums=('d3d3e9a0e3f6bce5127cb54886214f8f1b364c8b004be670e4564df61b215e07dcb4548834c8dc1c13db4e64e534e2340e33931af599e508cd1c9e8b7f736335'
        'bcbb7b636a5e49eaef648462d35e9072be3934953aa28e55011cd8746a0f0fca9a461bd4987e0bf5ef9aa33288223d683c4e83653cf2e5afb2be11438c3e2537'
        '6fa2a6adf165a614637f4aae5b323c427b99c2d13f9ab55eefae012dc3dbeebe5957cd2e2497e4c38426088a41dac89f6ac6284af6cf6a4a67a6780f409e8237')

prepare() {
	sed -i 's/{ver}/$_electronver/' freetube.sh
	mkdir -p data; tar xfC data.tar.xz data
	sed -i 's/\/opt\/FreeTube\/freetube/\/usr\/bin\/freetube/' \
           "$srcdir/data/usr/share/applications/freetube.desktop"
}

package() {
	depends=("electron$_electronver" 'ttf-liberation')
	install -Dm644 data/opt/FreeTube/resources/app.asar \
                   "$pkgdir/usr/lib/$pkgname/app.asar"
	install -Dm644 data/usr/share/applications/freetube.desktop \
                   "$pkgdir/usr/share/applications/freetube.desktop"
	install -Dm644 data/usr/share/icons/hicolor/scalable/apps/freetube.svg \
                   "$pkgdir/usr/share/icons/hicolor/scalable/apps/freetube.svg"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm755 freetube.sh "$pkgdir/usr/bin/freetube"
}
