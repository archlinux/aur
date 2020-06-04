# Maintainer: Benjamin Brown <brown.benjam@husky.neu.edu>
pkgname=deepspeech-bin
pkgver=0.7.3
pkgrel=1
pkgdesc="A TensorFlow implementation of Baidu's DeepSpeech architecture - C++ native client + devel files."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/mozilla/DeepSpeech"
license=('MPL2')
depends=('gcc-libs')
provides=('deepspeech')
conflicts=('deepspeech')

# Set all sources.
_src_base_url="https://github.com/mozilla/DeepSpeech/releases/download/v$pkgver"
_raw_base_url="https://raw.githubusercontent.com/mozilla/DeepSpeech/v$pkgver/"

# Reused checksums.
_header_sum='16563959019ce823249b1c8772528936f4aa61d89daa5a9a9544b37b95348f0c6fefa5836b7eb7d3b41eb90c1998fb94ccb9e9b02dec4f0df8f693efd706ec4f'
_pc_sum='9d113ec140500bc2e193ec3114ac072b4ea971299908435c50cef4f1fac070848ff86b63270e2521fbd4ce36e6c9b54554392d76077502e6d6cea297af160837'

# amd64
source_x86_64=("$_src_base_url/native_client.amd64.cpu.linux.tar.xz"
               "$_raw_base_url/native_client/deepspeech.h"
               "deepspeech.pc")
sha512sums_x86_64=('a9a79cdddab861fe06ae595471b63af92f7b1c6b320948e1c9bf4bf707e484e22800c30144f068af80f14c748d840d4268fe0901bc4e4a4ba920734bdc312b07'
                   "$_header_sum"
                   "$_pc_sum")

# armv7h
source_armv7h=("$_src_base_url/native_client.rpi3.cpu.linux.tar.xz"
               "$_raw_base_url/native_client/deepspeech.h"
               "deepspeech.pc")
sha512sums_armv7h=('0871b9cf1d3b1298a3281d5e62fe70b5bb5e994dbf03402a90162ab54871658238b61b580c7f64d1b9e9eba6870b8153c60c2e7beca6914cb8322fc8baf5ca42'
                   "$_header_sum"
                   "$_pc_sum")

# aarch64
source_aarch64=("$_src_base_url/native_client.arm64.cpu.linux.tar.xz"
                "$_raw_base_url/native_client/deepspeech.h"
                "deepspeech.pc")
sha512sums_aarch64=('ada530a74adf023879a6312c67529f4119bb58b6edd55581a2be0333bfd88bb4130cbf23b423a744e5181ef871f07506856df7e24739d1f6b6dc29c64e465de8'
                    "$_header_sum"
                    "$_pc_sum")

package() {
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include"
	mkdir -p "$pkgdir/usr/lib/pkgconfig"
    install -Dm755 libdeepspeech.so "$pkgdir/usr/lib/libdeepspeech.so.$pkgver"
    ln -s "/usr/lib/libdeepspeech.so.$pkgver" "$pkgdir/usr/lib/libdeepspeech.so"
    install -Dm644 deepspeech.h "$pkgdir/usr/include"
    install -Dm644 deepspeech.pc "$pkgdir/usr/lib/pkgconfig/deepspeech.pc"
}
