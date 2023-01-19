# Notes on Netlogger from previous maintainer:
# NetLogger is a shitty program.
# It is incredibly picky about what libraries it needs to run
# It refuses to work with anything except what it is distributed with.

# It's worth noting that I don't actually use this program
# and that I avoid nets that do, but unfortunately I do sorta need this to exist
# I apologize for anyone who participates on a net using NetLogger.
# To the NetLogger devs: grow up, learn security, and learn OSS.

# Maintainer: Tripp Sanders <K5TRP@protonmail.com>
# Contributor: Zeke Sonxx <zeke@zekesonxx.com>
pkgname=netlogger
pkgver=3.1.7
pkgrel=1
pkgdesc="Server-based amateur radio net logging programs"
arch=('x86_64')
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
source_x86_64=("http://www.netlogger.org/downloads/NetLogger_${pkgver}_Linux_x64.tgz")
noextract=()
validpgpkeys=()
sha256sums=('daed53263ec0cc784f6db24d33dfdc6075825ad45c0a8846a77604a28d6bf664'
            '3a4acd1436ab61678bddc122589e82db74ae66d84606fc3911b72d50c97a102e')
sha256sums_x86_64=('39b45a2ed07ebe2815490966c65a8796da8c89d0a4897312877c73c0e1e73a76')

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
