# Maintainer: hronro <hronro@gmail.com>
#
# Written for each release by linux/repo/aur.sh in
# https://github.com/hronro/ime-jd: change that, not this.

pkgbase=ime-jd-bin
pkgname=(ime-jd-fcitx5-bin ime-jd-ibus-bin ime-jd-userdict-bin)
pkgver=0.11.0
pkgrel=1
pkgdesc='键道输入法, an independent implementation of the 键道 (xkjd) input scheme'
arch=(x86_64 aarch64)
url=https://github.com/hronro/ime-jd
license=(GPL-3.0-or-later)
options=(!strip !debug)
_assets=https://github.com/hronro/ime-jd/releases/download/v$pkgver/jd-ime-v$pkgver-linux
source_x86_64=("$_assets-x86_64-"{fcitx5,ibus,userdict}.pkg.tar.zst)
source_aarch64=("$_assets-arm64-"{fcitx5,ibus,userdict}.pkg.tar.zst)
noextract=(jd-ime-v$pkgver-linux-{x86_64,arm64}-{fcitx5,ibus,userdict}.pkg.tar.zst)
sha256sums_x86_64=( 'd529628591d8ea942b2d7940509fea8b45bdc187ec0245340cc1c8f1092029be' '0a9690c2fc6b7936ee0759ace86521d9e770379fcdf3c87b8e718ec2d56b8aaa' '7f15d92a58166f1cd8cc277fdbc894bbfbd8f278e41c5b30f88935251bc5dcb4' )
sha256sums_aarch64=( '2edf597390c8af6d1657e4442fbb02a08c681350e73a3f4634036fe5dab1d4ab' '7a4d4dea6cfb272d64ccb0a1999a1441ad68730496e2c78011e402cbb1acafde' '4e09980f6fa9605b2540a287d346f7372f0b09959e957bec1ac2ed2d00ff82f9' )

# The release's Arch package for <frontend>, without its pacman metadata.
_unpack() {
    local arch=$CARCH
    [[ $arch == aarch64 ]] && arch=arm64
    bsdtar -xf "$srcdir/jd-ime-v$pkgver-linux-$arch-$1.pkg.tar.zst" -C "$pkgdir" --exclude '.*'
}

package_ime-jd-fcitx5-bin() {
    pkgdesc='键道输入法 for Fcitx 5'
    depends=('fcitx5>=5.0.14')
    optdepends=('ime-jd-userdict-bin: the window that edits the user dictionary')
    provides=(ime-jd-fcitx5)
    conflicts=(ime-jd-fcitx5)
    _unpack fcitx5
}

package_ime-jd-ibus-bin() {
    pkgdesc='键道输入法 for IBus'
    depends=('ibus>=1.5.26' gcc-libs)
    optdepends=('ime-jd-userdict-bin: the window that edits the user dictionary')
    provides=(ime-jd-ibus)
    conflicts=(ime-jd-ibus)
    _unpack ibus
}

package_ime-jd-userdict-bin() {
    pkgdesc="键道用户自造词, the window that edits 键道's user dictionary"
    depends=('gtk4>=4.6')
    provides=(ime-jd-userdict)
    conflicts=(ime-jd-userdict)
    _unpack userdict
}
