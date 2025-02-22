# Maintainer: Alleop <aur dot contest432 at passinbox dot com>
_pkgname=freetube
pkgname=${_pkgname}-electron-bin
pkgver=0.23.1
pkgrel=1
pkgdesc="An open source desktop YouTube player built with privacy in mind, with the system electron (unsupported)."
arch=('x86_64' 'aarch64' 'armv7l')
url='https://github.com/FreeTubeApp/FreeTube'
license=('AGPL3')
depends=('electron')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("freetube.sh")
md5sums=("d33746a34af29c1465eced22cf467f10")

source_x86_64=("${pkgname}-${pkgver}-amd64.deb"::"$url/releases/download/v$pkgver-beta/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-arm64.deb"::"$url/releases/download/v$pkgver-beta/${_pkgname}_${pkgver}_arm64.deb")
source_armv7l=("${pkgname}-${pkgver}-armv7l.deb"::"$url/releases/download/v$pkgver-beta/${_pkgname}_${pkgver}_armv7l.deb")

prepare() {
    mkdir -p data
    bsdtar -x -f data.tar.xz -C data
}

package() {
    install -d "$pkgdir"/usr/{bin,lib/$pkgname,share}/
    cp -a "$srcdir/data/opt/FreeTube/resources/app.asar" "$pkgdir/usr/lib/$pkgname/"
    cp -a "$srcdir"/data/usr/share/* "$pkgdir/usr/share/"
    sed -i 's/\/opt\/FreeTube\/freetube/freetube --ozone-platform-hint=auto/' "$pkgdir/usr/share/applications/freetube.desktop"
    install -Dm755 "./freetube.sh" "$pkgdir/usr/bin/freetube"
}

md5sums_x86_64=('027ad046a9ef426cfc63ce928bc6f166')
md5sums_aarch64=('ca445e76dca67e569ec032974e39bfdc')
md5sums_armv7l=('528e41ada52038bb29a6c51316fc3c70')
