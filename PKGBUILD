# Maintainer 2016-2018: Yadav Gowda <yadav . gowda __at__ gmail . com>
# Maintainer 2018-now : Vitrum <wqdxosty1yhj at bk dot ru>

pkgname=ibus-kmfl
pkgver=1.0.8
pkgrel=1
pkgdesc="Keyboard Mapping for Linux (KMFL) input method for IBus"
arch=('i686' 'x86_64')
url="http://kmfl.sourceforge.net/"
license=('GPL')
source=("https://sourceforge.net/projects/kmfl/files/kmfl/ibus-kmfl/ibus-kmfl-$pkgver.tar.gz")
depends=('kmflcomp' 'libkmfl' 'libibus')
noextract=()
options=()
md5sums=('af2357d253b6db9f5d8e9a15d6af6f93')

build() {
	LDFLAGS="${LDFLAGS} -lX11"
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

post_install() {
	echo '-----------------------------------------------------------------------------'
	echo 'INFORMATION: newly installed ibus-kmfl engine does not contain keyboard'
	echo 'layouts which can be obtained from the web-sites:'
	echo ''
	echo '* http://tavultesoft.com/keyman/downloads/keyboards/'
	echo '* https://github.com/keymanapp/keyboards'
	echo ''
	echo 'Uncompiled Keyman-style keyboard files (*.kmn) should be copied into the'
	echo "user's directory ~/.kmfl/ or system-wide /usr/share/kmfl/."
	echo ''
	echo 'After restarting ibus-deamon new layouts will be available in the'
	echo 'subcategory "Other". More information about the file format and layout'
	echo 'description language see on the web-site:'
	echo ''
	echo '* https://help.keyman.com/developer/'
	echo '-----------------------------------------------------------------------------'
}

