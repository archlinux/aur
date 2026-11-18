# Maintainer: hronro <hronro@gmail.com>
#
# Written for each release by linux/repo/aur.sh in
# https://github.com/hronro/ime-jd: change that, not this.

pkgbase=ime-jd-bin
pkgname=(ime-jd-fcitx5-bin ime-jd-ibus-bin ime-jd-userdict-bin)
pkgver=0.13.0
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
sha256sums_x86_64=( '52e6dcf4faf026993b4b82b8cc093cdf70ba97266caa92955ac9cf6548391979' '1275eeda938fcea0cc3f069dc97a0a0cfc1f59c09c55d376e1b3d6b4b9e3a524' '3980bbf4fcb7fd7bf1ad139726232b49c487360366e6ee65ceb23c5ba444891b' )
sha256sums_aarch64=( '5334379c91ac82a208a04e33b19bc5c4b9d1a820269ddafc675666f7a1694d76' 'f0fb80582910daaea6374f492fb2f67fec909238d603534683d958b9cb1378ca' 'c3ca5a4e7f6e319e3ca688c9052326adc9a2580f9e9783a1ad8744eff885ddd1' )

# The release's Arch package for <frontend>, without its pacman metadata.
_unpack() {
    local arch=$CARCH
    [[ $arch == aarch64 ]] && arch=arm64
    bsdtar -xf "$srcdir/jd-ime-v$pkgver-linux-$arch-$1.pkg.tar.zst" -C "$pkgdir" --exclude '.*'
}

package_ime-jd-fcitx5-bin() {
    pkgdesc='键道输入法 for Fcitx 5'
    depends=('fcitx5>=5.0.14')
    optdepends=('ime-jd-userdict-bin: the user-dictionary editor and the 编码反查 window')
    provides=(ime-jd-fcitx5)
    conflicts=(ime-jd-fcitx5)
    _unpack fcitx5
}

package_ime-jd-ibus-bin() {
    pkgdesc='键道输入法 for IBus'
    depends=('ibus>=1.5.26' gcc-libs)
    optdepends=('ime-jd-userdict-bin: the user-dictionary editor and the 编码反查 window')
    provides=(ime-jd-ibus)
    conflicts=(ime-jd-ibus)
    _unpack ibus
}

package_ime-jd-userdict-bin() {
    pkgdesc="键道用户自造词, the window that edits 键道's user dictionary, and 编码反查"
    depends=('gtk4>=4.6')
    provides=(ime-jd-userdict)
    conflicts=(ime-jd-userdict)
    _unpack userdict
}
