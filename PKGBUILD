#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=rclone-beta-bin
_srcname=rclone
pkgrel=2
pkgver=1.58.0_beta.5918.408d9f3e7
pkgdesc="Sync files to and from Google Drive, S3, Swift, Cloudfiles, Dropbox and Google Cloud Storage. (Beta version)"
provides=('rclone')
conflicts=('rclone' 'rclone-git' 'rclone-bin')
url="https://beta.rclone.org/"
license=('MIT')
depends=('glibc')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
_arch='linux-386'
[ "$CARCH" = 'x86_64' ] && _arch='linux-amd64'
[[ "$CARCH" = 'armv6h' || "$CARCH" = 'armv7h' ||
    "$CARCH" = 'arm' ]] && _arch='linux-arm'
[ "$CARCH" = 'aarch64' ] && _arch='linux-arm64'
source_i686=("https://beta.rclone.org/rclone-beta-latest-linux-386.zip")
source_x86_64=("https://beta.rclone.org/rclone-beta-latest-linux-amd64.zip")
source_arm=("https://beta.rclone.org/rclone-beta-latest-linux-arm.zip")
source_armv6h=("https://beta.rclone.org/rclone-beta-latest-linux-arm.zip")
source_armv7h=("https://beta.rclone.org/rclone-beta-latest-linux-arm-v7.zip")
source_aarch64=("https://beta.rclone.org/rclone-beta-latest-linux-arm64.zip")
source=("https://beta.rclone.org/version.txt")

b2sums=('SKIP')
b2sums_i686=('SKIP')
b2sums_x86_64=('SKIP')
b2sums_arm=('SKIP')
b2sums_armv6h=('SKIP')
b2sums_armv7h=('SKIP')
b2sums_aarch64=('SKIP')

pkgver() {
    cd "$srcdir"/ || exit
    grep -oP '\d.*$' version.txt | sed 's/-/\_/g'
}

package() {
    cd $srcdir/$_srcname-v$(grep -oP '\d.*$' version.txt)-$_arch || exit

    install -Dm755 rclone "$pkgdir/usr/bin/rclone"

    # install -Dm644 $srcdir/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -Dm644 rclone.1 "$pkgdir/usr/share/man/man1/rclone.1"
    install -d "$pkgdir/usr/share/doc/$pkgname"
    install -t "$pkgdir/usr/share/doc/$pkgname" -m644 README.html README.txt
}
