# Maintainer: boltbuckle <amygdala@cheerful.com>
# Contributor: Christopher Arndt <chris@chrisarndt.de>

pkgname=tracktion-6
pkgver=6.3.1
pkgrel=4
pkgdesc="Free-to-use Proprietary Digital Audio Workstation"
arch=('x86_64')
url="https://www.tracktion.com/"
license=('custom')
depends=('alsa-lib' 'freetype2' 'mesa' 'libxinerama')
makedepends=('paxtest')
optdepends=(
    'caps: The LADSPA C* Audio Plugin Suite'
	'fil-plugins: LADSPA four-band parametric equaliser plugins'
	'jack: A low-latency audio server'
	'ladspa: a basic set of ladspa plugins'
	'mcp-plugins: a set of LADSPA filters plugins'
	'rev-plugins: LADSPA stereo and ambisonic reverb plugin based on zita-rev1'
	"swh-plugins: Steve Harris' LADSPA plug-ins suite"
	"tap-plugins: Tom's LADSPA Plugins"
	"wah-plugins: LADSPA Wah filter plugin"
)
conflicts=()
source=("https://s3-us-west-2.amazonaws.com/tracktion-marketplace-public/archive/t6/TracktionInstall_6_3_1_Linux_64Bit.deb"
	'license'
	'Tracktion6.desktop'
)
install="tracktion.install"
md5sums=('77393f2440c1b3da9d5ea8e4fa315828'
         'd7bac73a1a52d26b337761a1d7ec561d'
         '5f3f8df1af8260db42a1ab4cc313d75a')

package() {
	tar -x --lzma -f data.tar.lzma -C "${pkgdir}"
    /usr/lib/paxtest/execstack -c "$pkgdir/usr/bin/Tracktion6"
	rm "$pkgdir/usr/share/applications/tracktion6.desktop"
	install -Dm644 "$startdir/Tracktion6.desktop" "$pkgdir/usr/share/applications/"
	install -Dm644 "$startdir/license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
