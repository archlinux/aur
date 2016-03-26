# Maintainer: Rick Kerkhof <rick.2889@gmail.com>
pkgname=soundnode-app-bin
pkgver=0.6.3
pkgrel=2
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
source=("https://raw.githubusercontent.com/Soundnode/soundnode-app/0.6.3/app/soundnode.png"
"soundnode-app.desktop")

sha256sums_x86_64=('15aa9524e37fc52276e4ec19a22936352785f8c132ead8b59c7bf6cdff0b1442')
sha256sums_i686=('bb53beb89ba67c327834191900191cc7ba242df0d32b51b449189aaa4fa4a4a4')

# Generic checksums.
sha256sums=('a16acc740d94ed119f943e810f44cdb2d082153645aafc1c179f15fb5b9a7619'
'fe904788e6a5695468e845f2a20baba44ce0968440f007eae1a9ed977ca8f132')

package() {
	install -dm755 "$pkgdir"/usr/bin
        install -dm755 "$pkgdir"/opt/
        install -dm755 "$pkgdir"/usr/share/applications/
        install -Dm644 "$srcdir"/soundnode-app.desktop "$pkgdir"/usr/share/applications/

        # We're creating a broken link here. It'll be fixed when all files are in place :)
        ln -s /opt/soundnode-app-bin/Soundnode "$pkgdir"/usr/bin/soundnode

        rm "$srcdir"/Soundnode-App.zip
        rm "$srcdir"/soundnode-app.desktop
	cp -Lr "$srcdir" "$pkgdir"/opt/"$pkgname"
}
