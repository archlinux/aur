# Maintainer: chung <me@chungn.com>
# Maintainer: Jay Chu <tothesong at gmail dot com>

pkgname=sunshine-bin
_pkgname=${pkgname%-bin}
pkgver=2025.924.154138
_gittag=v$pkgver
pkgrel=1
pkgdesc="A self-hosted game stream host for Moonlight."
url="https://app.lizardbyte.dev"
source=(
    "$_pkgname-$pkgver.pkg.tar.zst"::"https://github.com/LizardByte/Sunshine/releases/download/$_gittag/sunshine.pkg.tar.zst"
)
arch=('x86_64' 'aarch64')
license=('GPL-3.0-only')
install=sunshine.install
depends=(
    'avahi'
    'curl'
    'libayatana-appindicator'
    'libcap'
    'libdrm'
    'libevdev'
    'libminiupnpc.so'  # miniupnpc
    'libmfx'
    'libnotify'
    'libpulse'
    'libva'
    'libx11'
    'libxcb'
    'libxfixes'
    'libxrandr'
    'libxtst'
    'numactl'
    'openssl'
    'opus'
    'udev'
    'which'
)
optdepends=(
    'libva-mesa-driver: AMD GPU encoding support'
)
# makedepends=('patchelf')
conflicts=('sunshine')
provides=('sunshine')
b2sums=('3b9a7fdcc2c75ae31b4b8ec135a483ba89e7af7ea437a2c93fbaa5799e0bb9742c9452df5cda4145cf4465256fa0d5886b85685a44577b1a3a1358c5d66b7fcb')

# prepare() {
#     patchelf \
#     "usr/bin/sunshine"
#     --replace-needed libminiupnpc.so.{18,21} \
#     --replace-needed libicuuc.so.7{5,6} \
#     --replace-needed libboost_locale.so.1.8{3,6}.0 \
#     --replace-needed libboost_log.so.1.8{3,6}.0 \
#     --replace-needed libboost_filesystem.so.1.8{3,6}.0 \
#     --replace-needed libboost_program_options.so.1.8{3,6}.0 \
#     --replace-needed libboost_thread.so.1.8{3,6}.0 \
# }

package() {
    install -Dm755 "usr/bin/sunshine-$pkgver" "$pkgdir/usr/bin/sunshine"
    cp -r "usr/lib" "usr/share" "$pkgdir/usr"
}
