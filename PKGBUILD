# Maintainer: chung <me@chungn.com>
# Maintainer: Jay Chu <tothesong at gmail dot com>

pkgname=sunshine-bin
_pkgname=${pkgname%-bin}
pkgver=0.20.0
_gittag=v$pkgver
pkgrel=1
pkgdesc="Sunshine is a self-hosted game stream host for Moonlight."
url="https://app.lizardbyte.dev"
source=(
    "$_pkgname-$pkgver.pkg.tar.zst"::"https://github.com/LizardByte/Sunshine/releases/download/$_gittag/sunshine.pkg.tar.zst"
    "$_pkgname-$pkgver.desktop"::"https://raw.githubusercontent.com/LizardByte/Sunshine/$_gittag/packaging/linux/sunshine.desktop"
)
arch=('x86_64')
license=('GPL3')
depends=('avahi' 'boost-libs' 'curl' 'libappindicator-gtk3' 'libevdev' 'libmfx' 'libpulse' 'libva' 'libvdpau' 'libx11' 'libxcb' 'libxfixes' 'libxrandr' 'libxtst' 'numactl' 'openssl' 'opus' 'udev')
optdepends=(
    'cuda: NvFBC capture support'
    'libcap'
    'libdrm'
)
conflicts=('sunshine')
provides=('sunshine')
b2sums=('c4e7a2886e1440cad9341ad48e109fca393647cb507f9331f282734478a1beb00a897421c46f3ed638b87182449757c0ef0451a6d2a216fd4a9bb49f44663738'
        '2357c2a97a4f49ede3cb15f271a2e3c3696bdc91b65ce0d0f684026afdd9f9af293ec754231500cf8bc490379d8fa39df9bb6380aee318d98151050ef30aefa0')

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
