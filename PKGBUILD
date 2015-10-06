# Contributor: Schala <schalaalexiazeal@gmail.com>
# Contributor: Ng Oon-Ee <n g  o o n  e e dot t a l k AT g m a i l DOT c o m>
# Maintainer: TWPHoenix1982 <rene DOT landscheidt AT gmx DOT de>
pkgname=xojo
pkgver=2015r24
pkgrel=5
pkgdesc="A RAD environment based on BASIC that compiles native applications for Windows, Mac, Linux, and the web."
arch=(i686 x86_64)
url="http://www.xojo.com"
license=("custom")
source=("http://41160df63757fc043cfd-66287f38a83954e31a54d1dbe33e0650.r4.cf2.rackcdn.com/Xojo$pkgver/xojo$pkgver.tgz"
"xojo.desktop"
"lingua.desktop"
"RemoteDebuggerDesktop.desktop")
##[[ $CARCH == i686 ]] && depends=(gtk2 expat glib2 glibc mesa icu gcc-libs) && 
##makedepends=(lib32-webkitgtk2)
[[ $CARCH == i686 ]] && depends=(gtk2 expat glib2 glibc mesa icu gcc-libs)
##[[ $CARCH == x86_64 ]] && depends=(lib32-gtk2 lib32-expat lib32-glib2 lib32-glibc 
##lib32-mesa lib32-icu lib32-gcc-libs) && makedepends=(lib32-webkitgtk2)
[[ $CARCH == x86_64 ]] && depends=(lib32-gtk2 lib32-expat lib32-glib2 lib32-glibc lib32-mesa 
lib32-icu lib32-gcc-libs)
sha256sums=('c47a29c0a00b613be0a8db907cc25bea259fb09a2a7b85c863f8f0efe98fe679'
            '17250f624de25bb575a3ca5d3158a60cba95248c624d71959c0bcb823384e9ee'
            '7b084164ba9430b389a500a551a0cec5283f4eaa54dc27c01e7f0aa477e69612'
            '024cbfa8d23766b54aed636a52708f656776a45d6109cde3ca4278d463958e97')

package() {
	cd $srcdir
	mv "xojo2015r2.4" "xojo$pkgver"
	find . -name '.DS_Store' -exec rm {} \;
	find "./xojo$pkgver/Extras" -type d \( -name 'OS X' -o -name 'Windows' -o -name 'Visual Studio*' -o -name 'Xcode' \) |
    xargs -rtl1 -I {} rm -r {}
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/opt" "$pkgdir/usr/share/licenses/xojo"
	cp -r "xojo$pkgver" "$pkgdir/opt/xojo"
	ln -s "/opt/xojo/Xojo" "$pkgdir/usr/bin/Xojo"
	ln -s "/opt/xojo/Extras/Lingua/Lingua Linux" "$pkgdir/usr/bin/Lingua"
	ln -s "/opt/xojo/Extras/Remote Debugger Desktop/Linux/Remote Debugger Desktop" "$pkgdir/usr/bin/RemoteDebuggerDesktop"
	ln -s "/opt/xojo/Extras/RemoteDebugger Console/Linux/RemoteDebuggerConsole" "$pkgdir/usr/bin/RemoteDebuggerConsole"
	install -Dm644 "$srcdir/xojo.desktop" "$pkgdir/usr/share/applications/xojo.desktop"
	install -m644 "$srcdir/lingua.desktop" "$pkgdir/usr/share/applications/"
	install -m644 "$srcdir/RemoteDebuggerDesktop.desktop" "$pkgdir/usr/share/applications/"
	install -Dm644 "$pkgdir/opt/xojo/xojo.xpm" "$pkgdir/usr/share/pixmaps/xojo.xpm"
	ln -s "/opt/xojo/Read Mes/License Agreement.txt" "$pkgdir/usr/share/licenses/xojo/License Agreement.txt"
	ln -s "/opt/xojo/Extras/Plugin SDK/Plug-In SDK License.txt" "$pkgdir/usr/share/licenses/xojo/Plug-In SDK License.txt"
	ln -s "/opt/xojo/Extras/Plugin SDK/Plugin Converter/License.txt" "$pkgdir/usr/share/licenses/xojo/Plugin Converter License.txt"
	ln -s "/opt/xojo/Read Mes/Third Party Licenses and Notices.txt" "$pkgdir/usr/share/licenses/xojo/Third Party Licenses and Notices.txt"
#	ln -s "/usr/lib32/libwebkitgtk-1.0.so.0.17.5" "$pkgdir/usr/lib32/libwebkitgtk-1.0.0.so"
#	ln -s "/usr/lib32/libwebkitgtk-1.0.so.0.17.5" "$pkgdir/usr/lib32/libwebkitgtk-1.0.0.so.0"
#	Quick Temp Fix for the libncurses 5 error
	ln -s "/usr/lib32/libncursesw.so.6.0" "$pkgdir/usr/lib32/libncurses.so.5"
}
