# Maintainer: Alleop <aur dot contest432 at passinbox dot com>
_pkgname=freetube
pkgname=$_pkgname-electron-bin
pkgver=0.23.2
pkgrel=1
pkgdesc='An open source desktop YouTube player built with privacy in mind, with the system electron (unsupported).'
arch=('any')
url='https://github.com/FreeTubeApp/FreeTube'
license=('AGPL3')
depends=('electron' 'ttf-liberation')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('freetube.sh' "$pkgname-$pkgver-armv7l.deb"::"$url/releases/download/v$pkgver-beta/${_pkgname}_${pkgver}_armv7l.deb")
md5sums=('d33746a34af29c1465eced22cf467f10' '1a4e7f3c54579694129caf04394b5517')

prepare() {
    mkdir -p data
    bsdtar -x -f data.tar.xz -C data
}

package() {
    install -d "$pkgdir/usr/bin" "$pkgdir/usr/lib/$pkgname" "$pkgdir/usr/share"
    cp -a "$srcdir/data/opt/FreeTube/resources/app.asar" "$pkgdir/usr/lib/$pkgname/"
    cp -a "$srcdir"/data/usr/share/* "$pkgdir/usr/share/"
    sed -i 's/\/opt\/FreeTube\/freetube/freetube --ozone-platform-hint=auto/' "$pkgdir/usr/share/applications/freetube.desktop"
    install -Dm755 './freetube.sh' "$pkgdir/usr/bin/freetube"
}
