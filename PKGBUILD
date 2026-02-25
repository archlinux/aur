# Maintainer: vcup <me@vcup.moe>

_release_url='https://github.com/ThisSeanZhang/landscape/releases/download'

pkgname=landscape-bin
pkgver=0.14.0
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
b2sums=('dcf05e59e76775253d905e07a6446493714753318866c9d8ca241f6fbe3022cb5452d0ff934b098ab7aaf0bc8627726c6489faa7f5a59cae28d6290de49eaf92'
        'ff6364bb93cfa43914043802d5905b7b2c74686c432511b1bab2e074a924c9db01de4a95ecba04d74f9d469b97229ad909e58c58edcea0279bc83909fba0dd6c'
        'f227f1b2d224a77b18fc96417ff23afc9db8f47894cb4e7c5cf107b795117426fc24db9c24cd7764f0af5092ec11c101843ad7cd4aad08ed3dcf5b541b63bdf6'
        '8dcc5aafa2c9a53f1f010e5f344123a193e8869ddd734c019b0a4f2f816f664ca8d0942d0daa661eb579b3dcc32e4616e2b218b7cd8d945f32ccbc9b555bc3a8'
        'd5b7bf2ea0fedf848ca73baedb7c796b14d2b5b3e754c4bb4c0fe42a5aab3766f35d8620fb8fb34cfb900d3e4a3fcc5351523ed838e0daedde260e1ba6e115ef')
b2sums_aarch64=('f16e61233768fcaeca76bea0098fe6d135de4d4a913e17331fb4af1204d55f01fc7c294d86286f54f206bdd997097d50ccd4450f6059864ae75bc692799ecd8f'
                '2593e119a8cd2d36d2cc423b8f3d255b9f62205d21ca93f0f4cd0392ece6df886b59b6a5c3a5c903d274f861685772e80e0d4d823890af2fec983188cdcc1abd')
b2sums_loongarch64=('3e019efccba07ea61433a671db8346f8c794b012b4efe120e8ed1a0715378d9e1691a5c6f587dfdfaed0a9e3bb2c225aef9b906dbd4dd1e3d1aa452d2b51a823'
                    'd49167c9df6f6d124e41b8b0a42c6e79f88fa2a4d66deceef5fd139faa3b26a43ef4029abd979388e7e493a046837e0821d5d3da06976f1e6861d53595c22768')
b2sums_riscv64=('3fea792906bded12af967da4941e862c3afc92977c93a19de794dac3f7c38f6d61061709af76d3a56f2f4e89827f89774b485508567e377d76fee789d6bc8331'
                '7b18ecd2f71948cc0a3d031b54d83f1a397104f5bc382b6e616630111e56cc7344722f691fb1e99f5c1fde21715be1012ca997a443eb0cb2ab245356e512f58a')
b2sums_s390x=('10c3627fbece8caec823a121aabdeb5566fdb9a46c21712d096b7864b0a21ba8d94034ee24925698a12620dd06040d911652e3987357f836934f11b63f16c284'
              '553f5e5dcdb2c5714ed7820e45f8d3ca651421ae4da43580301154d555e08b28c7759fde718cc8c866644bc9dfa016e7b045a75f715a385e92b9ef91e0db1f08')
b2sums_x86_64=('cfdd9bc9d797cdbee8887ea26ec90002fea56fd67270d8e54cb517a0ed437266521a7ea74fd99e1c88985f25f6fc0f39dcb66442dcdb6e5675ddfbbdde177b12'
               '479859a8e4960a2491c3854d3b41ea53a6be68f2e754dd4a77b8e6b994ea9d7b2fc496a38cb513d7c1a56ad057c995da85f20419741990514196e2263fa25d9f')
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

