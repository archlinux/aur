# Maintainer: AUTplayed <fips.hem@gmail.com>
# Contributor: pavanjadhaw <pavanjadhaw96@gmail.com>
_pkgname=betterlockscreen
pkgname=$_pkgname
pkgver=3.0.1
pkgrel=1
pkgdesc="A simple lock script for i3lock-color"
arch=('any')
url="https://github.com/pavanjadhaw/${_pkgname}"
license=('MIT')
depends=('i3lock-color' 'imagemagick' 'xorg-xrandr' 'xorg-xdpyinfo' 'bc')
optdepends=('feh: Allows setting wallpaper')
conflicts=("betterlockscreen-git")
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=("b5646471fde0a28b925a0aa267b93d5d")
install=${_pkgname}.install

package() {
	_srcdir="$srcdir/${_pkgname}-${pkgver}"
	mkdir -p "$pkgdir/usr/bin"
    cp "$_srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    if [[ $(pidof systemd) ]]; then
        _serviceloc="$pkgdir/etc/systemd/system"
        mkdir -p "$_serviceloc"
        _servicename="$_pkgname@.service"
        cp "$_srcdir/$_servicename" "$_serviceloc/$_servicename"
    fi
	mkdir -p "$pkgdir/usr/share/doc/$_pkgname/examples"
	cp "$_srcdir/examples/${_pkgname}rc" "$pkgdir/usr/share/doc/$_pkgname/examples/${_pkgname}rc"

}
