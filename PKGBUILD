#Maintainer: Leonard König <leonard dot r dot koenig at googlemail dot com>
pkgname=unity-editor
_pkgver=5.1.0f3
pkgver=${_pkgver}+2015082501
pkgrel=1
pkgdesc="A cross-platform game engine used to develop video games for PC, consoles, mobile devices and websites. Linux Preview package"
arch=('x86_64')
url="https://unity3d.com"
license=('custom')
depends=('gtk2' 'gdk-pixbuf2' 'glib2' 'glibc' 'glib2' 'glu' 'atk' 'cairo' 'pango' 'fontconfig' 'libpng'
	 'pcre' 'libffi' 'freetype2' 'alsa-lib' 'gconf' 'expat' 'libcups' 'libcap' 'libdbus' 'harfbuzz'
	 'pixman' 'nspr' 'bzip2' 'dbus-glib' 'gnutls' 'avahi' 'attr' 'graphite' 'p11-kit' 'libtasn1'
	 'nettle' 'gmp' 'libgl'
)
makedepends=('tar')
source=("http://download.unity3d.com/download_unity/${pkgname}-installer-${pkgver}.sh"
	"eula")
#source=("https://developer.android.com/training/index.html")
md5sums=('dbe1ddc9ebc999b6b538829a90df99a8'
	 '715ba338bad7d12b31bb3642dadd92d4')
options=('!strip')

build() {
  ARCHIVE=$(awk '/^__ARCHIVE_BEGINS_HERE__/ {print NR + 1; exit 0; }' $pkgname-installer-$pkgver.sh)
  echo $ARCHIVE
  tail -n+$ARCHIVE $pkgname-installer-$pkgver.sh | tar xj
}

package() {
 install -D -m644 eula "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
 mv $srcdir/$pkgname-$_pkgver/Editor/chrome-sandbox $srcdir/
 install -d $pkgdir/usr/share/applications
 mv $srcdir/$pkgname-$_pkgver/*.desktop $pkgdir/usr/share/applications/
 install -d $pkgdir/usr/share/icons
 mv $srcdir/$pkgname-$_pkgver/*.png $pkgdir/usr/share/icons/
 install -d /$pkgdir/opt/Unity
 mv $srcdir/$pkgname-$_pkgver/* $pkgdir/opt/Unity
 install -oroot -m4755 $srcdir/chrome-sandbox $pkgdir/opt/Unity/Editor/
}
