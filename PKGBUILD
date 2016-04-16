# Maintainer: Rick Kerkhof <rick.2889@gmail.com>
pkgname=soundnode-app-bin
pkgver=0.6.4
pkgrel=1
pkgdesc="Soundcloud client for the desktop"
arch=('x86_64' 'i686')
url="http://www.soundnodeapp.com/"
license=('GPL3')

# Required, otherwise it won't run.
options=('!strip')

depends=('gconf' 'gtk2' 'libxtst' 'nss' 'alsa-lib' 'libnotify' 'fontconfig')

# I couldn't figure out how to build it properly and the website has no per-release
# archives. The SHA256sums will fail if it updates; that should be an indication that
# this package has become out of date.
source_x86_64=("http://www.soundnodeapp.com/downloads/linux64/Soundnode-App.zip")
source_i686=("http://www.soundnodeapp.com/downloads/linux32/Soundnode-App.zip")

# Generic sources.
source=("https://raw.githubusercontent.com/Soundnode/soundnode-app/$pkgver/app/soundnode.png"
"soundnode-app.desktop")

sha256sums=('a16acc740d94ed119f943e810f44cdb2d082153645aafc1c179f15fb5b9a7619'
            'fe904788e6a5695468e845f2a20baba44ce0968440f007eae1a9ed977ca8f132')
sha256sums_x86_64=('2b0dbdb6a59546472f9621b25be1b29aa60c22c3f8e692940dad698de85aa432')
sha256sums_i686=('d37ba2d4b9945d6c9001e2ecf210dcef72c82089df2e9aa3eb3a2ff57a9d7480')

# Generic checksums.

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
