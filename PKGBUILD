# shellcheck shell=bash
# shellcheck disable=SC2034,SC2148,SC2154
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
pkgver=3.1.5
pkgrel=1
pkgdesc="Server-based amateur radio net logging programs"
arch=('i686' 'x86_64')
url="http://www.netlogger.org"
license=('custom:freeware')
groups=()
depends=('qt5-base' 'gnutls' 'libpng12')
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
md5sums_i686=('7cf83737c7cab1acb9da2ee21f3ea48d')
md5sums_x86_64=('618fa8a8a7f22700577288759db3a4fb')
sha512sums=('e9dbe309baf520dc434a6b958fd6ae55f0c47c19a3ad00de158cb90b2fffec0e92ce83558e7ffec9613f30579929069ae543f8ad9da1d3d9110177dc86e48c5c'
            '4cac720ec96ea2c6f27253b10eec43b07f21175e555e7d3716dcf71c88d9863167d89c08500e6c82d2e441839508919d0261f944a817dcb243f8f77169e28edd')
sha512sums_i686=('1cbffd63d4d8317c523253cc85ab57b5c509b3e65dc6e63d1480c19f0d96b5359489c315d039cc423e81391322eafe57bf03ef5701163c6cdadf14a15aadd029')
sha512sums_x86_64=('553d68732cf92009c193237f49928dce234889db92bfc5c7c8c733786fd491fdbc894266029ac3b72dfb32ad9e66dbb180b3c49698e3669f284c6d55fcbc8e87')
validpgpkeys=()

prepare() {
	cd "$srcdir" || exit
  # extract the tgz within the tgz to a directory called 'tarball' so we can work with it
  mkdir -p "$srcdir/tarball"
	bsdtar -x -f netlogger_${pkgver}.tgz -C tarball

	# copy out the license file for sticking in /usr/share/licenses later
	# (install is a cheap way of also modifying file attributes)
	install -m777 "$srcdir/tarball/License.rtf" "$srcdir/license.rtf"

	# get rid of the extra files
	cd "$srcdir/tarball" || exit
	rm -f GNU_LGPL_v2.1.rtf GNU_LGPL_v3.rtf GNU_GPL_v3.rtf NetLogger24to30.pdf Release_Notes.html License.rtf
}

package() {
	cd "$pkgdir" || exit
	mkdir -p "$pkgdir/opt/netlogger/"
	cp -r "$srcdir/tarball/" -T "$pkgdir/opt/netlogger/"
	install -D -m755 "${srcdir}/netlogger.sh" "${pkgdir}/usr/bin/netlogger"
	install -D -m644 "${srcdir}/netlogger.desktop" "${pkgdir}/usr/share/applications/netlogger.desktop"
	install -D -m644 "${srcdir}/license.rtf" "${pkgdir}/usr/share/licenses/netlogger/license.rtf"
}
