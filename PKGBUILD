# Mantainer: Jens Staal <staal1978@gmail.com>
# Contributor : ackalker
pkgname=openwatcom-v2
pkgver=2.0
pkgrel=5
pkgdesc="The Open Watcom Fortran/C/C++ compiler, binary distribution -V2 fork"
arch=('x86_64')
#url="http://www.openwatcom.org"
url="https://github.com/open-watcom"
license=('custom:OWPL-1')
source=(
'https://github.com/open-watcom/open-watcom-v2/releases/download/Current-build/ow-snapshot.tar.gz'
'owsetenv.sh'
)
#md5sums change frequently since it is a snapshot. If it fails, download manually and check md5sum
md5sums=('SKIP' 'fed7651420d74b7d89302c5ef0a9d8a8')
options=(!strip)

build() {
	ls 
}

package() {
	mkdir -p "${pkgdir}/opt"
	cp -r "${srcdir}/" "${pkgdir}/opt/watcom"
	rm -rf "${pkgdir}/opt/watcom/binw"
	rm -rf "${pkgdir}/opt/watcom/binnt"
	rm -rf "${pkgdir}/opt/watcom/binp"
	rm -rf "${pkgdir}/opt/watcom/binnt64"
	install -d "${pkgdir}/usr/share/licenses/watcom"
	install -Dm644 "$pkgdir/opt/watcom/license.txt" "$pkgdir/usr/share/licenses/watcom/license.txt"

	msg "correct permissions for header directories"
	chmod -R 755 $pkgdir/opt/watcom/{h,lh}
	
	msg "adding some fake binaries to make life easier"
	cd $pkgdir/opt/watcom/binl
	ln -s /usr/bin/true ranlib
	ln -s wlib ar
} 
