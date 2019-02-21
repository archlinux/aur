# Maintainer: robertfoster
# Contributor: said
# Contributor: Ner0
# Contributor: farnsworth517

pkgname=soulseekqt
pkgver=20180130
_pkgver=2018-1-30
pkgrel=4
pkgdesc="A desktop client for the Soulseek peer-to-peer file sharing network"
arch=('x86_64')
url="http://www.soulseekqt.net/news/"
license=('CUSTOM')
depends=('fontconfig' 'libxext' 'libxrender' 'qt5-multimedia')
source=("https://www.dropbox.com/s/0vi87eef3ooh7iy/SoulseekQt-${_pkgver}-64bit.tgz"
	selinux-mock.c
	soulseekqt.sh
	$pkgname.desktop
)
options=("!strip")

package () {
	cd $srcdir

	msg2 "Extraction..."
	./SoulseekQt-${_pkgver}-64bit.AppImage  --appimage-extract

	msg2 "Compiling libselinux.so.1 fakelib"
	gcc -s -shared -o libselinux.so.1 -Wl,-soname,libselinux.so.1 selinux-mock.c

	msg2 "Installing assets..."
	install -vDm755	"SoulseekQt-${_pkgver}-64bit.AppImage" "$pkgdir/opt/soulseekqt/$pkgname.AppImage"
	install -vDm755 libselinux.so.1 "$pkgdir/opt/soulseekqt/libselinux.so.1"
	install -vDm755 soulseekqt.sh "$pkgdir/usr/bin/$pkgname"
	install -vDm644 squashfs-root/soulseek.png "$pkgdir/usr/share/pixmaps/soulseek.png"
	install -vDm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

md5sums=('1d98331893bc9b9d45ba34f6523353ab'
	'4ed42be654289fc9cd7f4181c363f745'
	'a95f77dbfe0b714b31866273ff47a206'
'2544611108889c2c4c7a9084672f4d32')
