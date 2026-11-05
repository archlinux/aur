# Maintainer: hronro <hronro@gmail.com>
#
# Written for each release by linux/repo/aur.sh in
# https://github.com/hronro/ime-jd: change that, not this.

pkgbase=ime-jd-bin
pkgname=(ime-jd-fcitx5-bin ime-jd-ibus-bin ime-jd-userdict-bin)
pkgver=0.10.0
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
sha256sums_x86_64=( '27d777a8ed91324521798efe9fc5cf61ce9fd4071bdb82d9661996dcb1f8f0f5' '166a815837c731401b9405b1d7be735fc9f34d3b81fc4d57926647bc7373139c' 'd08c9b411e5473768b37569bd4efc68d2f41e6303d98b726e5d5755c96a3f69d' )
sha256sums_aarch64=( 'a64b552d3f9f87a2c1bd187c424ca1fbdbf37f4eec1ab4d7e259810862055493' 'd5646d780b0648e72aab5da8f9a633cef6da2e2b7a0407e92d86a0daff9b902c' 'de8128c9f33695f553d29fb0ac789cf1a59c9417cbbcd264fbe2f57f5eaff6e0' )

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
