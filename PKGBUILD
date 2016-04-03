# Notes on Netlogger:
# NetLogger is a shitty program.
# It is incredibly picky about what libraries it needs to run
# It refuses to wrok with anything except what it is distributed with.

# It's worth noting that I don't actually use this program
# and that I avoid nets that do, but unfortunately I do sorta need this to exist
# I apologize for anyone who participates on a net using NetLogger.
# To the NetLogger devs: grow up, learn security, and learn OSS.

# Maintainer: Zeke Sonxx <zeke@zekesonxx.com>
pkgname=netlogger
pkgver=3.0.3
pkgrel=2
pkgdesc="Server-based amateur radio net logging programs"
arch=('i686' 'x86_64')
url="http://www.netlogger.org"
license=('custom:freeware')
groups=()
depends=('qt5-base')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('netlogger.sh' 'netlogger.desktop')
source_i686=("http://www.netlogger.org/downloads/NetLogger_${pkgver}_Linux_x86.tgz")
source_x86_64=("http://www.netlogger.org/downloads/NetLogger_${pkgver}_Linux_x64.tgz")
noextract=()
md5sums=('309082574abaa3f97851ef4ac7096297'
         'e5410b0ab8875791fffa0f7306d473ff')
md5sums_i686=('010122004ea491a0e8790e925b7389ff')
md5sums_x86_64=('6e7e17f59d7102d1b081ffe090187cba')
sha512sums=('e9dbe309baf520dc434a6b958fd6ae55f0c47c19a3ad00de158cb90b2fffec0e92ce83558e7ffec9613f30579929069ae543f8ad9da1d3d9110177dc86e48c5c'
            '4cac720ec96ea2c6f27253b10eec43b07f21175e555e7d3716dcf71c88d9863167d89c08500e6c82d2e441839508919d0261f944a817dcb243f8f77169e28edd')
sha512sums_i686=('a09c5f9ee3f4f672f85c2eda53179f0a26fbd12f088ed4fe5cb9cc2fe14900b1b16ffa0c90229243ab2d8438fb4f6bb4ecf24e605e0d0c4ff78ced919b02b7a5')
sha512sums_x86_64=('9a11ec0d25ab159b5f282734c374d34a029538f20b18ac850ee0abeb3b83da5105c733fbb728161b222df4a32d7a07ce76f19950d826580e65d273a1e3015ee1')
validpgpkeys=()

prepare() {
	cd "$srcdir"
  # extract the tgz within the tgz to a directory called 'tarball' so we can work with it
  mkdir -p "$srcdir/tarball"
	bsdtar -x -f netlogger_${pkgver}.tgz -C tarball

	# copy out the license file for sticking in /usr/share/licenses later
	# (install is a cheap way of also modifying file attributes)
	install -m777 "$srcdir/tarball/License.rtf" "$srcdir/license.rtf"

	# get rid of the extra files
	cd "$srcdir/tarball"
	rm -f ClubInfoList.txt GNU_LGPL_v2.1.rtf NetLogger24to30.pdf Release_Notes.html License.rtf
}

package() {
	cd "$pkgdir"
	mkdir -p "$pkgdir/opt/netlogger/"
	cp -r "$srcdir/tarball/" -T "$pkgdir/opt/netlogger/"
	install -D -m755 "${srcdir}/netlogger.sh" "${pkgdir}/usr/bin/netlogger"
	install -D -m644 "${srcdir}/netlogger.desktop" "${pkgdir}/usr/share/applications/netlogger.desktop"
	install -D -m644 "${srcdir}/license.rtf" "${pkgdir}/usr/share/licenses/netlogger/license.rtf"
}
