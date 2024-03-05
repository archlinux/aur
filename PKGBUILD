# Maintainer: chung <me@chungn.com>
# Maintainer: Jay Chu <tothesong at gmail dot com>

pkgname=sunshine-bin
_pkgname=${pkgname%-bin}
pkgver=0.22.0
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
b2sums=('854bbb391f93202efacf40de24c921dc934b3cf82427abc21fb39c0fa6f0ec2a37e2950bb506b91c593a89d0e118d4198378497dedff79f9728b7ebae98cab0e'
        '3832939c0bb5634dfc8c1cfc32ab13e48db8760f1adee4ba832f5de98d4eb4b630ba297af7e1a1f6657defc9ef5f95efa69434de98fdf265d9f02c7b1cc6a759')

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
