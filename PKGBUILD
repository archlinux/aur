# Maintainer: chung <me@chungn.com>
# Maintainer: Jay Chu <tothesong at gmail dot com>

pkgname=sunshine-bin
_pkgname=${pkgname%-bin}
pkgver=0.21.0
_gittag=v$pkgver
pkgrel=1
pkgdesc="A self-hosted game stream host for Moonlight."
url="https://app.lizardbyte.dev"
source=(
    "$_pkgname-$pkgver.pkg.tar.zst"::"https://github.com/LizardByte/Sunshine/releases/download/$_gittag/sunshine.pkg.tar.zst"
    "$_pkgname-$pkgver.desktop"::"https://raw.githubusercontent.com/LizardByte/Sunshine/$_gittag/packaging/linux/sunshine.desktop"
)
arch=('x86_64')
license=('GPL3')
depends=('avahi'
         'boost-libs'
         'curl'
         'libayatana-appindicator'
         'libevdev'
         'libmfx'
         'libnotify'
         'libpulse'
         'libva'
         'libvdpau'
         'libx11'
         'libxcb'
         'libxfixes'
         'libxrandr'
         'libxtst'
         'numactl'
         'openssl'
         'opus'
         'udev')
optdepends=('cuda: NvFBC capture support'
            'libcap'
            'libdrm')
conflicts=('sunshine')
provides=('sunshine')
b2sums=('ee223327df1847d40d634a8c239a5aaab74fca9db9722bb9f8931164fc5a0ddfca2612c4b721d18f759eeb8ee943bc53247f6106c96ae1b4ce51e79d0f853bd6'
        '6d424d6a3402b1696bf6124224b7caaeb7e444b16d4855dba16536d6b24dfe0f34bfd1a6f10f217e91004368512864820ae4c686a675f7822786b3de3c4fc43d')

prepare() {
    sed -i "s/@PROJECT_NAME@/$_pkgname/g" "$_pkgname-$pkgver.desktop"
    sed -i "s/@PROJECT_DESCRIPTION@/$pkgdesc/g" "$_pkgname-$pkgver.desktop"
    sed -i "s/@PROJECT_VERSION@/$_gittag/g" "$_pkgname-$pkgver.desktop"
}

package() {
    install -Dm755 "usr/bin/sunshine-v$pkgver" "$pkgdir/usr/bin/sunshine"
    install -Dm644 "$_pkgname-$pkgver.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    cp -r "usr/lib" "usr/share" "$pkgdir/usr"
}
