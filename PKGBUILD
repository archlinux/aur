# Maintainer: hronro <hronro@gmail.com>
#
# Written for each release by linux/repo/aur.sh in
# https://github.com/hronro/ime-jd: change that, not this.

pkgbase=ime-jd-bin
pkgname=(ime-jd-fcitx5-bin ime-jd-ibus-bin ime-jd-userdict-bin)
pkgver=0.10.1
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
sha256sums_x86_64=( 'befe58477bd3a8aad4a666e3ae610a6cba4939e3b709d399b52c902f1135fc75' '770ac8221d0f913632789e6f5d56af59c80c111cffddc676b437619e586fedca' '2f0536a8da0240a6fee52e29d8c83717c631f50ca519eec26dbe426dc2cec2ca' )
sha256sums_aarch64=( '39b9942566a1d7daf503ac9c2fd3e41008c746339ad5560b983085a72569753d' 'b4433f6b1d9aeb465fdc2f2b9d00d49fe6d527c179f37fa18bc79e2788661a6f' '704ac289a20e2321472d2b41ba8b1c012e5ed898518ddc4b202254da47be3600' )

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
