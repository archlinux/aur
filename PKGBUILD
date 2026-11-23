# Maintainer: hronro <hronro@gmail.com>
#
# Written for each release by linux/repo/aur.sh in
# https://github.com/hronro/ime-jd: change that, not this.

pkgbase=ime-jd-bin
pkgname=(ime-jd-fcitx5-bin ime-jd-ibus-bin ime-jd-userdict-bin)
pkgver=0.14.0
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
sha256sums_x86_64=( '3db03dc44670023e0ef526c0c43e08a660fe3590cc48180029085e3fbb2f1aff' 'ed05ee423395c3350cc89d30ee64897466508728e4cbd7511edb2e39bc72b6c8' 'dc4eb07944d213af069c22c36f7ba09ab5291a6b196ce9dd25c1e7616c5d7bc1' )
sha256sums_aarch64=( '946e3ede9ed908761a609f8c2323f6608cf61e40c9cbd7d49e51d9489243353a' '1b0d5e63461a9997b1b0445e6820c1499385eab22b7fc16c608436ed02b129eb' '8dae081c00fe7a349088bc8c928c4d50ed34d764deed80f34dca205d0651d32e' )

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
