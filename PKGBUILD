# Maintainer: Tomasz Łaziuk <tlaziuk@gmail.com>

pkgname=worksnaps
pkgver=1.1.20150618
pkgrel=1
pkgdesc="Time Tracking with Screenshots for Remote Teams"
arch=('any')
url="http://www.worksnaps.com/www/download.shtml"
license=('unknown')
depends=('jre7-openjdk')
source=("http://worksnaps-download.s3.amazonaws.com/WSClient-linux-$pkgver.zip")
md5sums=('7bc4f74ac3d7ed0e889172596c32eff7')

prepare() {
    src='#!/usr/bin/env sh
path="/usr/lib/worksnaps/bin/run.sh"
script=$(realpath "$path")
cd $(dirname "$script")
exec "$script"'
    filename="$srcdir/worksnaps"
    echo "$src" > "$filename"
    chmod a+x "$filename"
}

package() {
    mkdir -p "$pkgdir/usr/lib"
    cp -r --preserve=mode,timestamps "$srcdir/Worksnaps" "$pkgdir/usr/lib/worksnaps"
    mkdir -p "$pkgdir/usr/bin"
    cp -r --preserve=mode,timestamps "$srcdir/worksnaps" "$pkgdir/usr/bin/worksnaps"
}
