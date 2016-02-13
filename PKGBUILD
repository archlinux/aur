# Maintainer: Rick Kerkhof <rick.2889@gmail.com>
pkgname=soundnode-app-bin
pkgver=0.6.2
pkgrel=3
pkgdesc="Soundcloud client for the desktop"
arch=('x86_64' 'i686')
url="http://www.soundnodeapp.com/"
license=('GPL3')

# Required, otherwise it won't run.
options=('!strip')

depends=('gconf')

# I couldn't figure out how to build it properly and the website has no per-release
# archives. The SHA256sums will fail if it updates; that should be an indication that
# this package has become out of date.
source_x86_64=("http://www.soundnodeapp.com/downloads/linux64/Soundnode-App.zip")
source_i686=("http://www.soundnodeapp.com/downloads/linux32/Soundnode-App.zip")

# Generic sources.
source=("https://raw.githubusercontent.com/Soundnode/soundnode-app/0.6.2/app/soundnode.png"
"soundnode-app.desktop")

sha256sums_x86_64=('e3d6b88150d286645553f803edd6163e53e967415fa9e38d7bbbf9f9182f7a7a')
sha256sums_i686=('049429c52e6e91944f8100eed8a7b6b3c235d5ef49a3bcf60b74a638ffb7f445')

# Generic checksums.
sha256sums=('aaae33882ab1e2334b4a33b4235cbdd4beb1379b08f5fa3a0a270f716ea43fa7'
'a62a6bf1f28f21ba9d32b642cd29e9685a1c1f889347d041a1ab02e65dbbc2ca')

package() {
	install -dm755 "$pkgdir"/usr/bin
        install -dm755 "$pkgdir"/opt/
        install -dm755 "$pkgdir"/usr/share/applications/
        install -Dm644 "$srcdir"/soundnode-app.desktop "$pkgdir"/usr/share/applications/

        # We're creating a broken link here. It'll be fixed when all files are in place :)
        ln -s /opt/soundnode-app-bin/Soundnode-App "$pkgdir"/usr/bin/soundnode

        rm "$srcdir"/Soundnode-App.zip
        rm "$srcdir"/soundnode-app.desktop
	cp -Lr "$srcdir" "$pkgdir"/opt/"$pkgname"
}
