#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=rclone-beta-bin
_srcname=rclone
pkgrel=1
pkgver=1.69.0_beta.8364.69897b97f
pkgdesc="Sync files to and from Google Drive, S3, Swift, Cloudfiles, Dropbox and Google Cloud Storage. (Beta version)"
provides=('rclone')
conflicts=('rclone' 'rclone-git' 'rclone-bin')
url="https://beta.rclone.org/"
license=('MIT')
options=('!debug')
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
b2sums_i686=('63e97ea03d45f755118f01168ad6c3d3a969523cdd2fc2c830f43b85b7beab8972cef428adc49a8c16f35a11fe2c43e8768d19b1cc307d118ec29063abcfb14e')
b2sums_x86_64=('03ee264c8a4a9766c2e248ea750c14e34fe3d4fce366f2ff15ff332778626bc30f870effe24dc23c3cde2436348039e6b30ab6630808fbfe92ee50c02675d9bc')
b2sums_arm=('be0afa3380d19d2bebffae2b5f7f7564e81b0666bc73b4a550241a3583d4eb7d041fe61c7836f2f45024c8870df4fbb0937b38c017e5e6a87d4cc04723b50115')
b2sums_armv6h=('be0afa3380d19d2bebffae2b5f7f7564e81b0666bc73b4a550241a3583d4eb7d041fe61c7836f2f45024c8870df4fbb0937b38c017e5e6a87d4cc04723b50115')
b2sums_armv7h=('5865d62d158411965320e994f2dac00f9624b577b72b4fce93e63dcfc6571da47fa84f2faa9d9a14b5a1d3ff32d69c75078badd434781b2b6b7c83ab79cbce41')
b2sums_aarch64=('8313308b2c0b8b224af287d22f2382a004a4d5827dd64ec5caf32dcb8ee79b83bce3116815612699f1fdbd142a1aa463d871355605dc3f044a1150560b1df637')



package() {
    cd $srcdir/$_srcname-v$(grep -oP '\d.*$' version.txt)-$_arch || exit

    install -Dm755 rclone "$pkgdir/usr/bin/rclone"

    # install -Dm644 $srcdir/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -Dm644 rclone.1 "$pkgdir/usr/share/man/man1/rclone.1"
    install -d "$pkgdir/usr/share/doc/$pkgname"
    install -t "$pkgdir/usr/share/doc/$pkgname" -m644 README.html README.txt
}
