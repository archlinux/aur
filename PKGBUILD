# Maintainer: Rick Kerkhof <rick.2889@gmail.com>
pkgname=soundnode-app-bin
pkgver=0.6.5
pkgrel=2
pkgdesc="Soundcloud client for the desktop"
arch=('x86_64' 'i686')
url="http://www.soundnodeapp.com/"
license=('GPL3')
conflicts=('soundnode', 'soundnode-git')
provides=('soundnode')


# Required, otherwise it won't run.
options=('!strip')

depends=('gconf' 'gtk2' 'libxtst' 'nss' 'alsa-lib' 'libnotify' 'fontconfig')

# I couldn't figure out how to build it properly and the website has no per-release
# archives. The SHA256sums will fail if it updates; that should be an indication that
# this package has become out of date.
source_x86_64=("http://www.soundnodeapp.com/downloads/linux64/Soundnode.zip")
source_i686=("http://www.soundnodeapp.com/downloads/linux32/Soundnode.zip")

# Generic sources.
source=("https://raw.githubusercontent.com/Soundnode/soundnode-app/$pkgver/app/soundnode.png"
"soundnode-app.desktop")

sha256sums=('a16acc740d94ed119f943e810f44cdb2d082153645aafc1c179f15fb5b9a7619'
            'd96b0f8c37bf51f50c1129f01262e35b24ab615976a7cb4b11427af11eeee819')
sha256sums_x86_64=('ecf085044347a4b35ea4c558ab65296edd8c107f84f88fb5e88e5b72454475c1')
sha256sums_i686=('b5ff7b2008ee327f93e31b7dd9179ebf30fa6b49c9234abe5bff788f38918b97')

# Generic checksums.

package() {
	install -dm755 "$pkgdir"/usr/bin
        install -dm755 "$pkgdir"/opt/
        install -dm755 "$pkgdir"/usr/share/applications/
        install -Dm644 "$srcdir"/soundnode-app.desktop "$pkgdir"/usr/share/applications/

        # We're creating a broken link here. It'll be fixed when all files are in place :)
        ln -s /opt/soundnode-app-bin/Soundnode "$pkgdir"/usr/bin/soundnode

        rm "$srcdir"/Soundnode.zip
        rm "$srcdir"/soundnode-app.desktop
	cp -Lr "$srcdir" "$pkgdir"/opt/"$pkgname"
}
