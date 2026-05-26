# Maintainer: vcup <me@vcup.moe>

_release_url='https://github.com/ThisSeanZhang/landscape/releases/download'

pkgname=landscape-bin
pkgver=0.19.2
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
b2sums=('c10037e3a6ae7bc495eb5cc23e2bc8bdda277b2244ac320517984e762836367ff0d52b064b43f41ec1faa864dae9d7bc9e8118053bc1c40ccebe088eb4af897e'
        'ff6364bb93cfa43914043802d5905b7b2c74686c432511b1bab2e074a924c9db01de4a95ecba04d74f9d469b97229ad909e58c58edcea0279bc83909fba0dd6c'
        'f227f1b2d224a77b18fc96417ff23afc9db8f47894cb4e7c5cf107b795117426fc24db9c24cd7764f0af5092ec11c101843ad7cd4aad08ed3dcf5b541b63bdf6'
        '8dcc5aafa2c9a53f1f010e5f344123a193e8869ddd734c019b0a4f2f816f664ca8d0942d0daa661eb579b3dcc32e4616e2b218b7cd8d945f32ccbc9b555bc3a8'
        'd5b7bf2ea0fedf848ca73baedb7c796b14d2b5b3e754c4bb4c0fe42a5aab3766f35d8620fb8fb34cfb900d3e4a3fcc5351523ed838e0daedde260e1ba6e115ef')
b2sums_aarch64=('309876d1f4c1bee2acd34bccb5234d3632989c9309d358620f9279160377f573ec5ad83d2a3240834382bf13dbb0107a65c91224ea2315890534dc16497be009'
                'f5dd41642bb7481aa296065b3a55eb2180115979c1a7dccc35d37ac6744f982af45b32be3e0300a64d7233069491772fd5ec573e108394283c0b40f2dd5f4797')
b2sums_loongarch64=('e768fa01c590fd6a9b2dff29ec219a2b045b9480881abc395f903e6f086e83ce0bbe8aabc266c5015395b13a05a51d00e77b019bdaa38af2391ab7446023a223'
                    '12d825a6d834e9c1e2122cc407ee794da0d6fb42f685405e321d56cc1b18fd8d91f3a3cb53fbe7fb195d92bc5aeaf3732e43962d88f1ba5c9f46e391bf4f80c5')
b2sums_riscv64=('38f0d2d2c40c60ea7bfc767bf6c72dcf8b9cbb32f524ec82f1c61c9ef83deb226c73ffc72eaca50d523c1f924c43eb1ea2fdd08b73420e1697113bfb1ad98658'
                'eb6d5d78d328e84e1e1b143fa2dea7d1a8b61d1f9b2d706067deee695c407fbbf3888d2c8bdf181cf91c39c30ecd2d3a74dbb9d3058f876768ae1baeb0c7fc47')
b2sums_s390x=('19706d93b7e2510efe52337712cb2f9e1727ba50b11fb5be281c93de5f3652ae29a7a2feccb3ddebe065868f37bb04fcc4b939572f4777d259879d21a70ae613'
              'c9b9117a34f0fe4d2f576fa34031b35e9627db15c75d254c4cdffd771e31975392c9973bb61036c1ee9eda6cd430bb1ea510cbc8d3392b7e219f9baeaf419261')
b2sums_x86_64=('35732cc58a8326038d3410f8458f4c9eddb2c510bf1fa657b58b290f224b444adeaa88a7af49e8b25e3113340675d80f559d9533605afc55c56c138fd3ec84af'
               '5d4c38f33578f026cfed24205bad6c5852dfe0f4b10b29785a6f85c90179d10bb9f556d7de461eb5b7394f5ecb485b1dccfe5f3531641c816fa10ce3fb005377')
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

