# Maintainer: vcup <me@vcup.moe>

_release_url='https://github.com/ThisSeanZhang/landscape/releases/download'

pkgname=landscape-bin
pkgver=0.16.3
pkgrel=1
pkgdesc="The goal is to easily configure your favorite Linux distribution as a router using the web UI"
arch=('aarch64' 'loongarch64' 'riscv64' 's390x' 'x86_64')
url="https://github.com/ThisSeanZhang/landscape"
license=('GPL-3.0')
source=(
  "static-${pkgver}.zip::${_release_url}/v${pkgver}/static.zip"
  'landscape-webserver.service'
  'LICENSE'
  'sysusers'
  'tmpfiles'
)
source_aarch64=(
  "landscape-webserver-${pkgver}-aarch64::${_release_url}/v${pkgver}/landscape-webserver-aarch64"
  "redirect_pkg_handler-${pkgver}-aarch64::${_release_url}/v${pkgver}/redirect_pkg_handler-aarch64"
)
source_loongarch64=(
  "landscape-webserver-${pkgver}-loongarch64::${_release_url}/v${pkgver}/landscape-webserver-loongarch64"
  "redirect_pkg_handler-${pkgver}-loongarch64::${_release_url}/v${pkgver}/redirect_pkg_handler-loongarch64"
)
source_riscv64=(
  "landscape-webserver-${pkgver}-riscv64::${_release_url}/v${pkgver}/landscape-webserver-riscv64"
  "redirect_pkg_handler-${pkgver}-riscv64::${_release_url}/v${pkgver}/redirect_pkg_handler-riscv64"
)
source_s390x=(
  "landscape-webserver-${pkgver}-s390x::${_release_url}/v${pkgver}/landscape-webserver-s390x"
  "redirect_pkg_handler-${pkgver}-s390x::${_release_url}/v${pkgver}/redirect_pkg_handler-s390x"
)
source_x86_64=(
  "landscape-webserver-${pkgver}-x86_64::${_release_url}/v${pkgver}/landscape-webserver-x86_64"
  "redirect_pkg_handler-${pkgver}-x86_64::${_release_url}/v${pkgver}/redirect_pkg_handler-x86_64"
)
b2sums=('70e3013ae299f5e448db820934c2a98b275bb8887c85a82fada1b97d41ec08536d05a7d81d16d07ec6653beaf468ea26705208c9b0f130ba1b673607357ba619'
        'ff6364bb93cfa43914043802d5905b7b2c74686c432511b1bab2e074a924c9db01de4a95ecba04d74f9d469b97229ad909e58c58edcea0279bc83909fba0dd6c'
        'f227f1b2d224a77b18fc96417ff23afc9db8f47894cb4e7c5cf107b795117426fc24db9c24cd7764f0af5092ec11c101843ad7cd4aad08ed3dcf5b541b63bdf6'
        '8dcc5aafa2c9a53f1f010e5f344123a193e8869ddd734c019b0a4f2f816f664ca8d0942d0daa661eb579b3dcc32e4616e2b218b7cd8d945f32ccbc9b555bc3a8'
        'd5b7bf2ea0fedf848ca73baedb7c796b14d2b5b3e754c4bb4c0fe42a5aab3766f35d8620fb8fb34cfb900d3e4a3fcc5351523ed838e0daedde260e1ba6e115ef')
b2sums_aarch64=('cebc016d665e4adb51c6a7cb351772f66533909c1e082b61fa5879cef0c3891a4858fbf9ed36173cca64eae9d4a25fb1ea585adc8ff2a342beef5b78e7d38f14'
                'f3ae9afa646009f1d1678c9fb2f20cd8da66e3eb40b4acd75ee781f2b8e7ebee6ae32d31ae0df44e5c233658be1b69f1b75aed73b38f39a8f1af52c5320a94e9')
b2sums_loongarch64=('93bb7ec24aeb1bd0e07c4bc980ecfc5030f86fbcbd5e8b55b30203d04447b97de3a427e6f04d943513135a58ff630445f1b703679564a707c798a4c96b303053'
                    'c04ee48331ea232c1d9cfd0b6c974a54fbc40e38a68cb071d138acecd1fdb5eec35d71f06ce236cdbfd3cceefe889a996ce2025d314ffe692622bc1059cf1dc3')
b2sums_riscv64=('f4cf040c5e602b3ec0378ef03faa3305e5581a782c08826fa531662deb77ad3190cb9685e33faa7e118abeae1995b5f20da0ea70ca5510bf38feecad76c37de0'
                '5030317f5c8517794a910fef34765a9be0724726c5c008a9a6546833f4ac054028e557034c0bb5526f17caab4282d1cdedca1996da64d9494b3d04b0466b669a')
b2sums_s390x=('1f69196f26e60ab06a296fe9ca3372f294a2ed24fc2b0517c67e6147a8568676a2145ddae40afb0ae4b8b9c407c3f99a55540c1e24a6462e061fdbb67061c447'
              '712145796c9fc3baac074f6000ce3893063e3123b1e62bf17a742d207c66bfeef71919250b5500e2ae850005e50e72f2f11d1288bc1e2c9156587f38564e5da3')
b2sums_x86_64=('42017f5c8d15473cc10e94c3f2edee0ae6f51e4b5c658d52b144270f800acebc11dd63366e3ec6682075e8582cc14a39cedeb464be0ca33f15ece02be6c8ef4b'
               'b4b497eaaff1157d6975e6726b7fdbaa88f2def52acf521da718c63e1c0a468f152db9570cbf06cd495ccbd1272fc4e87742af1124c572caca0f35aabd997fc4')
provides=('landscape')
conflicts=('landscape')

package() {
  declare -A _files
  install -dm755 "${pkgdir}/usr/lib/landscape" "${pkgdir}/var/log/landscape"
  
  _files=(
    ["landscape-webserver-${pkgver}-${CARCH}"]="usr/bin/landscape-webserver:755:0:0"
    ["redirect_pkg_handler-${pkgver}-${CARCH}"]="usr/bin/redirect_pkg_handler:755:0:0"
    ["sysusers"]="usr/lib/sysusers.d/landscape.conf:644:0:0"
    ["tmpfiles"]="usr/lib/tmpfiles.d/landscape.conf:644:0:0"
    ["landscape-webserver.service"]="usr/lib/systemd/system/landscape-webserver.service:644:0:0"
    ["LICENSE"]="usr/share/licenses/landscape/LICENSE:644:0:0"
  )

  mv "${srcdir}/static" "${pkgdir}/usr/lib/landscape/static"

  for source_file in "${!_files[@]}"; do
    target_file="$(cut -f 1 -d ':' <<< "${_files[$source_file]}")"
    mode="$(cut -f 2 -d ':' <<< "${_files[$source_file]}")"
    user="$(cut -f 3 -d ':' <<< "${_files[$source_file]}")"
    group="$(cut -f 4 -d ':' <<< "${_files[$source_file]}")"
    install -Dm "$mode" -o "$user" -g "$group" "${source_file}" "${pkgdir}/${target_file}"
  done
}

