# Maintainer: vcup <me@vcup.moe>

_release_url='https://github.com/ThisSeanZhang/landscape/releases/download'

pkgname=landscape-bin
pkgver=0.17.3
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
b2sums=('b11a5b439d9249275ed6d6ee3dd68e2e924986f83534eeae0c22e31baa7f9bfca4476ad227b39f9b60c9488d90a416c4a4402c15881ac3b99f9956ab70581b79'
        'ff6364bb93cfa43914043802d5905b7b2c74686c432511b1bab2e074a924c9db01de4a95ecba04d74f9d469b97229ad909e58c58edcea0279bc83909fba0dd6c'
        'f227f1b2d224a77b18fc96417ff23afc9db8f47894cb4e7c5cf107b795117426fc24db9c24cd7764f0af5092ec11c101843ad7cd4aad08ed3dcf5b541b63bdf6'
        '8dcc5aafa2c9a53f1f010e5f344123a193e8869ddd734c019b0a4f2f816f664ca8d0942d0daa661eb579b3dcc32e4616e2b218b7cd8d945f32ccbc9b555bc3a8'
        'd5b7bf2ea0fedf848ca73baedb7c796b14d2b5b3e754c4bb4c0fe42a5aab3766f35d8620fb8fb34cfb900d3e4a3fcc5351523ed838e0daedde260e1ba6e115ef')
b2sums_aarch64=('deccdaa35d1f03cdfd25a0b98e3dd24a2398beffbf13a737233c4c6694defd53a0b1e5b7a14e96c7621c4e24a9f263e1f056ebdd7fdd851a6bdd5a2be6a0e4a5'
                '5041a5fb2508004c522b4e4e4de3812fd4647d7c7826770a309420ebfbf3e22db2475e39cad70155fcfc86cdfe5eb53e9ad9fda8fe8e3b125e1f273df4b3fe32')
b2sums_loongarch64=('549ac61e9cdf001f0b6b376a6abddca08ea55e06b2494ef63f19471be70855bbeeeb88c3fc171848c9a61c0f6a6aef191b6979c9e6f93c2ed586c184a13a505d'
                    '9dcbe8e082cf4acbd7cf30ed9ce09a9e98bbdb500ec7f4c27b0882630d805c432979f30f7db7a0aeb640e670bb4b27c974a0db18378a7951a6be1d33a9798851')
b2sums_riscv64=('92121c9bfd9c0fbd9b930351feec907378184e03701bef88d7aab7c048d8e2587ed976f2e257da6166759462a6b2950a86200dbc1d5349e26dd8717414878f19'
                'cc61990e8571cc34535bd60bb9c7de8466d7d66f10747d05c012ffbd84367d7844db8c7268c66e980c9871026fabb2e4e4b90f7acab909f32429d3546315315f')
b2sums_s390x=('15696e1386fd1add2f23db2d4bdd0e4c52d3fc920ea48ea473e43bc03462bbc873bab60b3d2402049da9b3d6e5a684fb4296fb172e26c4408466fda3be142cf2'
              '13468954b6f991a43efd63bf541e60db005a14233a13212860c3be586586f46fac17ca30b96ee9d8aa793f6f45c6f1f18b5c79dd6c67435d347f06389dc75ed7')
b2sums_x86_64=('f48b2f559dbfcc9067e9bc54984219fcbc70c7e105319a40b9e452a14d57637b24e49678688426a2c5431541378fd29b6036869d0be76b1b97068a8668f66bb0'
               '4949148dc7d34718c05098e40d8efa9689c3c4deec5aac2a7dccb9059c46c0c98c0f6bfe84c84c6d98358f3b8342ede97f2b018f6d772f08c6f38d2f8c15fc77')
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

