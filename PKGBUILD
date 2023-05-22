# Maintainer: chung <me@chungn.com>
# Contributor: Jay Chu <tothesong at gmail dot com>

pkgname=sunshine-bin
_pkgname=${pkgname%-bin}
pkgver=0.19.1
_gittag=v$pkgver
pkgrel=4
pkgdesc="Sunshine is a self-hosted game stream host for Moonlight."
url="https://app.lizardbyte.dev"
source=(
    "https://github.com/LizardByte/Sunshine/releases/download/$_gittag/sunshine.pkg.tar.zst"
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
b2sums=('7321ad9099eeef7491587e93ca56ea48a2580c3e4626743deb82eafaf0a59b60d0e7dea35c9a04f27e6115eaea7bb12bbd59ce229df7b06e92ce71608aa64bb5'
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
