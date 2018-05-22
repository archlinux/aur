# Maintainer: flops <flopss at gmail dot com>
pkgname=portainer-desktop
pkgver=1.0
pkgrel=1
pkgdesc="Portainer wrapper for localhost"
arch=('i686' 'x86_64')
url="https://portainer.io"
license=('unknown')
makedepends=('nodejs')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
provides=('portainer-desktop')
sha512sums=('373dc9aedc478146ad6920ff39d2cf441ed68f52c31904f7ccea32ac69ff88433de658a9602b3e331d1498de9225ad430504f98c6441fbdd349560a8bb8aec94'
            '099327a4b1e8324a53fe985507a9191cf99f38445dfd9748cb1b2a064a2e017a0f7b8f5e4ab51065c0ccb3f3a51c5a323f926f738cf19a6d519d1012eb09a427'
            '849e35d962d685bd678a33683373dc01b6d9d68584381dae4ae28170812bb4f5c31b2a7b1ac28018fbcea4a40a0a6ddf310e7a8ac74303ebd34edb84f6b210ad'
            '71f4e69ce7cbd1aa524ba43d694ae8fcc24b383cf671aac0789b3b487b346fac794720357acc2ae8546151fd438957d1cc8e4d3cd9c712fc3fc678ab4a11eab6'
            '8221f15ff984c8218d83f079ed8f4e14a839d6766798a4828e5e61d9baa27452abf08d11b3b93cc174c805665f8ecece5313f05bca31414bf0c903c992bc121b')
source=('package.json'
		'package-lock.json'
		'portainer-desktop.png'
        'portainer-desktop.desktop'
		'portainer-desktop.sh')

build() {
	cd $srcdir

	npm install
	npm start
}

package() {
	install -dm755 "$pkgdir/opt/portainer-desktop"
	install -dm755 "$pkgdir/usr/bin/"
	install -dm755 "$pkgdir/usr/share/pixmaps/"
	install -dm755 "$pkgdir/usr/share/applications/"

	cp -R "$srcdir/portainer-linux-x64/." "$pkgdir/opt/portainer-desktop/"
	chmod 755 "$pkgdir/opt/portainer-desktop/resources/app"

	install -Dm755 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm755 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}

