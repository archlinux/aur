# Maintainer: Konstantin Kogan <kostyalamer@yandex.ru>
# Contributor: Konstantin Kogan <kostyalamer@yandex.ru>
pkgname=tray_mixer_plus
pkgver=0.0.5
pkgrel=1
epoch=1
pkgdesc="Small tray sound volume control based tray_mixer project by Claudio Matsuoka and other authors."

arch=('i686' 'x86_64')
url="http://forum.altlinux.org"
license=('GPL')
depends=('xterm' 'alsa-utils')
makedepends=('gtk2' 'gtk2+extra' 'alsa-lib')
source=("http://altlinuxclub.ru/arhiv/${pkgname}-${pkgver}.tar.gz")
md5sums=('c54b88a45db8b1c9b0395c1c918305be')

build() {
cd "${srcdir}/${pkgname}-${pkgver}"
make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX2=/usr
make
cat > $pkgname.desktop <<@@@
[Desktop Entry]
Type=Application
Name=Tray Mixer Plus
Icon=/usr/share/icons/tray_mixer_plus/speaker.png
TryExec=tray_mixer_plus
Exec=tray_mixer_plus
Terminal=false
Categories=AudioVideo;Audio;Mixer;
@@@
}

package() {
cd "$srcdir/$pkgname-$pkgver"
#make install
mkdir -p $pkgdir/usr/share/icons/$pkgname
cp -R icons/$pkgname $pkgdir/usr/share/icons
mkdir -p $pkgdir/usr/share/locale/ru/LC_MESSAGES
cp -R intl/$pkgname/ru_RU.mo $pkgdir/usr/share/locale/ru/LC_MESSAGES/$pkgname.mo

install -pDm755 $pkgname $pkgdir/usr/bin/$pkgname
install -pDm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}

