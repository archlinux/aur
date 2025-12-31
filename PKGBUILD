# Maintainer: sfs <sfslinux@gmail.com>

pkgname=brushshe
pkgver=2.4.0
pkgrel=1
pkgdesc="Raster graphical editor"
arch=('any')
url="https://github.com/limafresh/Brushshe"
license=('MPL2.0' 'CC0')
depends=('python' 'tk' 'python-pillow')
source=("brushshe.desktop")
sha256sums=('SKIP'
	    'e86d31e40f1172a5fe54b413193aba58ad42fd46fa7e5a89271f50787e04decc')

pkgver() {
    echo $_pkgver
}
prepare() {
    source=("`wget -qO- https://api.github.com/repos/limafresh/Brushshe/releases/latest |jq -r '.assets[].browser_download_url' |grep deb`")
    _pkgver="$(echo "$source" | sed -n 's|.*/v\([0-9.]\+\).*|\1|p')"
    echo $source $pkgver
        wget "$source" -O ${pkgname}.deb &&
	bsdtar -xf ${pkgname}.deb &&
    tar -xf data.tar.xz
}

package() {
    cp -dr --no-preserve=ownership opt usr "${pkgdir}"/
    install -Dm644 $srcdir/brushshe.desktop "$pkgdir/usr/share/applications/brushshe.desktop"
}
