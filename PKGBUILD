# Maintainer: chung <me@chungn.com>
# Maintainer: Jay Chu <tothesong at gmail dot com>

pkgname=sunshine-bin
_pkgname=${pkgname%-bin}
pkgver=0.23.0
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
         'miniupnpc'
         'numactl'
         'openssl'
         'opus'
         'udev')
optdepends=('cuda: NvFBC capture support'
            'libcap'
            'libdrm')
conflicts=('sunshine')
provides=('sunshine')
b2sums=('e1c7103110497c0e31a93fcc0895de3b5e95edf4ccce2de18c26d4816a34e51e36ee8fadf7f3adf13c2d2c6a48196911b7bf53487684945527350f2fb7b486b5'
        '6d8d4bdbf645258545e50d01ea5a2a6ea85ba937bd6adaa659cb4106531b76613915ac24f54e60546c77e07b9b01ed702c441556c75080f0d29ef3005b7763d8')

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
