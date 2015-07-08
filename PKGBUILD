# Maintainer: hadrons123 <piruthviraj@gmail.com>
# Maintainer: Shanto <shanto@hotmail.com>
# Contributor: JIN Xiao-Yong <jinxiaoyong@gmail.com>
# Contributor: Andre Fettouhi <A.Fettouhi@gmail.com>

pkgname=freetype2-infinality
pkgver=2.4.12
pkgrel=4
_pkgdate=20150206
_pkgrel=01
pkgdesc="TrueType font rendering library with infinality patch"
arch=(i686 x86_64)
license=('GPL')
url="http://www.infinality.net/blog/infinality-freetype-patches/"
depends=('zlib' 'bzip2' 'sh')
optdepends=(
	'fontconfig-infinality: Infinality package for fontconfig (required)'
)
conflicts=('freetype2')
provides=("freetype2=$pkgver")
options=('!libtool')
install='install.sh'
backup=('etc/profile.d/infinality-settings.sh')
source=(
	"http://downloads.sourceforge.net/sourceforge/freetype/freetype-${pkgver}.tar.bz2"
	"http://www.infinality.net/fedora/linux/zips/freetype-infinality-2.4.12-20130514_01-x86_64.tar.bz2"
	"freetype-2.2.1-enable-valid.patch::https://projects.archlinux.org/svntogit/packages.git/plain/trunk/freetype-2.2.1-enable-valid.patch?h=packages/freetype2"
    "freetype-2.5.0-CVE-2014-2240.patch"
    "freetype-2.5.0-CVE-2014-2241.patch"
"freetype-2.4.11-ft-strncmp.patch"
"freetype-2.4.11-CVE-2014-9657.patch"
"freetype-2.4.11-CVE-2014-9658.patch"
"freetype-2.4.11-CVE-2014-9660.patch"
"freetype-2.4.11-CVE-2014-9663.patch"
"freetype-2.4.11-CVE-2014-9667.patch"
"freetype-2.4.11-CVE-2014-9669.patch"
"freetype-2.4.11-CVE-2014-9670.patch"
"freetype-2.4.11-CVE-2014-9671.patch")
build() {
	rm -rf "${srcdir}/freetype-${pkgver}-build"
	cp -a "${srcdir}/freetype-${pkgver}" "${srcdir}/freetype-${pkgver}-build"
	cd "${srcdir}/freetype-${pkgver}-build"
	cat "$srcdir/"{freetype-2.2.1-enable-valid.patch,freetype-entire-infinality-patchset-20130514-01.patch,freetype-2.4.11-CVE-2014-9657.patch,freetype-2.4.11-CVE-2014-9658.patch,freetype-2.4.11-ft-strncmp.patch,freetype-2.4.11-CVE-2014-9660.patch,freetype-2.4.11-CVE-2014-9663.patch,freetype-2.4.11-CVE-2014-9669.patch,freetype-2.4.11-CVE-2014-9670.patch,freetype-2.4.11-CVE-2014-9671.patch,freetype-2.5.0-CVE-2014-2240.patch,freetype-2.5.0-CVE-2014-2241.patch} | patch -Np1
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/freetype-${pkgver}-build"
	make DESTDIR="${pkgdir}" install
	install -D -T "${srcdir}/infinality-settings.sh" "${pkgdir}/etc/profile.d/infinality-settings.sh"
}
md5sums=('3463102764315eb86c0d3c2e1f3ffb7d'
         '4f5ff3fd3e3e56310953e25eade4a2d3'
         '214119610444c9b02766ccee5e220680'
         'e29654122be7dbfbc828b1f890257f40'
         '54d52c143c5e399972f2928d17b0f28e'
         '451163e82887b59f0c0fad72a652f316'
         'd8c69d190a81133d40b92d1d2ab81c98'
         '82055b1adb096766cf4269658ce5a68b'
         '79e695ff3714fb66dcdadd2a4b82f418'
         '817ff425988e4f91dbd08b1f4bfaf5b4'
         'a1560e1032cd0fb113aee6ce7b0c951e'
         'c5cbf68b7b2f3beeb766e8d97d9f723e'
         '1bf2b83b8623ac4fed57dbe4e4f7714c'
         'f543132d39f801a230768dc133fd4870')
