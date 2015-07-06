# Contributor: Harvie
# Maintainer: realitygaps
pkgname=autozen
pkgver=2.1
pkgrel=3
pkgdesc="A binural brainwave generator. Cause the user to experience an altered state of consciousness. Wear headphones. Don't use if you suffer for any kind of epilepsy and use at your own risk!"
url="http://www.linuxlabs.com/autozen.shtml"
license="GPL"
arch=('i686' 'x86_64')
source=(http://www.sourcefiles.org/Miscellaneous/$pkgname-$pkgver.tar.gz)
depends=('gtk')
md5sums=('8d85f8435f3733b9ea835cd0ffd106cc')

build() {
#Make
cd ${srcdir}/${pkgname}-${pkgver}/ || return 1
make clean || return 1
make || return 1

mkdir -p ${pkgdir}/usr/
make "PREFIX=${pkgdir}/usr" install || return 1

#Menu Icons
mkdir -p ${pkgdir}/usr/share/applications/

echo '[Desktop Entry]
Encoding=UTF-8
Name=AutoZen
GenericName=BrainWave Generator/Synchronizator
Exec=autozen
Icon=autozen
Categories=Application;GTK;AudioVideo;Player;
Terminal=false
Type=Application
' > ${pkgdir}/usr/share/applications/autozen.desktop

echo '[Desktop Entry]
Encoding=UTF-8
Name=AutoZen (colorbox)
GenericName=BrainWave Generator/Synchronizator
Exec=autozen -colorbox
Icon=autozen
Categories=Application;GTK;AudioVideo;Player;
Terminal=false
Type=Application
' > ${pkgdir}/usr/share/applications/autozen-colorbox.desktop

#Rights
chmod -R 755 ${pkgdir}
}
