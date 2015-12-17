# Contributor: Schala <schalaalexiazeal@gmail.com>
# Contributor: Ng Oon-Ee <n g  o o n  e e dot t a l k AT g m a i l DOT c o m>
# Maintainer: TWPHoenix1982 <rene DOT landscheidt AT gmx DOT de>
pkgname=xojo
pkgver=2015r4
pkgrel=3
pkgdesc="A RAD environment based on BASIC that compiles native applications for Windows, Mac, Linux, the web and now with 64Bit and ARM V2 (Raspberry Pi 2) support."
arch=(i686 x86_64)
url="http://www.xojo.com"
license=("custom")
source=("http://41160df63757fc043cfd-66287f38a83954e31a54d1dbe33e0650.r4.cf2.rackcdn.com/Xojo$pkgver/xojo$pkgver.tgz"
"xojo.desktop"
"lingua.desktop"
"RemoteDebuggerDesktop.desktop"
"xojo.xpm")
##[[ $CARCH == i686 ]] && depends=(gtk2 expat glib2 glibc mesa icu gcc-libs) && makedepends=(lib32-libtinfo libtinfo)
##makedepends=(lib32-webkitgtk2)
[[ $CARCH == i686 ]] && depends=(gtk2 expat glib2 glibc mesa icu gcc-libs) && makedepends=(lib32-libtinfo)
##[[ $CARCH == x86_64 ]] && depends=(lib32-gtk2 lib32-expat lib32-glib2 lib32-glibc 
##lib32-mesa lib32-icu lib32-gcc-libs) && makedepends=(lib32-webkitgtk2)
[[ $CARCH == x86_64 ]] && depends=(lib32-gtk2 lib32-expat lib32-glib2 lib32-glibc lib32-mesa 
lib32-icu lib32-gcc-libs) && makedepends=(lib32-libtinfo libtinfo)
sha256sums=('b267869c22561e32dcf94f8b11d269d2e33a339e1fd327e0e5bc22299caaaeaf'
            '17250f624de25bb575a3ca5d3158a60cba95248c624d71959c0bcb823384e9ee'
            '7b084164ba9430b389a500a551a0cec5283f4eaa54dc27c01e7f0aa477e69612'
            '024cbfa8d23766b54aed636a52708f656776a45d6109cde3ca4278d463958e97'
            '7d87245d685c0cd744f3fdb10b539d361cd86c8e23f3b1dbc86e5ada69d8042f')
options=(!strip)

package() {
	cd $srcdir
	# mv "xojo2015r3.1" "xojo$pkgver"
	find . -name '.DS_Store' -exec rm {} \;
	find "./xojo$pkgver/Extras" -type d \( -name 'OS X' -o -name 'Windows' -o -name 'Visual Studio*' -o -name 'Xcode' \) |
    xargs -rtl1 -I {} rm -r {}
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/opt" "$pkgdir/usr/share/licenses/xojo" "$pkgdir/usr/lib32"
	cp -r "xojo$pkgver" "$pkgdir/opt/xojo"
	cp "xojo.xpm" "$pkgdir/opt/xojo"
	# Reparieren der Dateirechte	
	chmod 755 "$pkgdir/opt/xojo/Xojo Resources/Linux/HoudiniAssistant"
	chmod 755 "$pkgdir/opt/xojo/Xojo Resources/Linux/libc++.so.1"
	chmod 755 "$pkgdir/opt/xojo/Xojo Resources/SDKStubs/linux-arm/libgcc_s.so.1"
	chmod 755 "$pkgdir/opt/xojo/Xojo Libs/XojoGUIFramework32.so"
	chmod 755 "$pkgdir/opt/xojo/Xojo Libs/libc++.so.1"
	ln -s "/opt/xojo/Xojo Resources/Linux/libc++.so.1" "$pkgdir/usr/lib32/libc++.so.1"
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
#	ln -s "/usr/lib32/libncursesw.so.6.0" "$pkgdir/usr/lib32/libncurses.so.5"
}
