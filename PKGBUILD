# Maintainer: vcup <me@vcup.moe>

_release_url='https://github.com/ThisSeanZhang/landscape/releases/download'

pkgname=landscape-bin
pkgver=0.18.3
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
b2sums=('00ba0e104445442e8b9b7bcb323de4d3b8a710a196cb659fe0f0abfb084fd2ef9741cd30e74980af0591c37cd0c215a0b916b14075892b087378c53b03fa4d65'
        'ff6364bb93cfa43914043802d5905b7b2c74686c432511b1bab2e074a924c9db01de4a95ecba04d74f9d469b97229ad909e58c58edcea0279bc83909fba0dd6c'
        'f227f1b2d224a77b18fc96417ff23afc9db8f47894cb4e7c5cf107b795117426fc24db9c24cd7764f0af5092ec11c101843ad7cd4aad08ed3dcf5b541b63bdf6'
        '8dcc5aafa2c9a53f1f010e5f344123a193e8869ddd734c019b0a4f2f816f664ca8d0942d0daa661eb579b3dcc32e4616e2b218b7cd8d945f32ccbc9b555bc3a8'
        'd5b7bf2ea0fedf848ca73baedb7c796b14d2b5b3e754c4bb4c0fe42a5aab3766f35d8620fb8fb34cfb900d3e4a3fcc5351523ed838e0daedde260e1ba6e115ef')
b2sums_aarch64=('1f13cecce25cc61da60162ddd848e191798b31bbbcde5e3372a5f4601c8982abf2284967c6ab8c371de28358da1d958f8da5692cb22fe3a6c82a75d2726a3e71'
                'a517f01dd96571e0a20069d3b4bfbc8fac6ef68613ea95be6726252e4c8c3a4d6d4ee947a91a6e3cac4bbaabc8fb30e9b60c3365b39b96fe7a65db34eb1d66c1')
b2sums_loongarch64=('c5817281f7a89a4ce8be80406f5ca912420cab99bf1d93a73622b120377e7f2ca65307a2b657eced15e60699c8c74878a6b0ff3fd1a36fb8a183342d7b415bcc'
                    '4620f3f74a3c7e749e1ff688a018a924ca9398ef4c0598da6ecde0fe62dc1c6d45fad09700392fd22c35b247c5c9d94b9771a9fa146437fbd43a15dffc95f4d8')
b2sums_riscv64=('2fb6b019a4bbfbb7c4b09ae34f6e38fb151613d3dd7ca07546192ba15d4036234861207efb9b3acab2bcfa44394e1757e8a0b54cf8d171d8f92b98de5fa84ad8'
                'd9f8ae9d91b996201a0ec33d8c9c09cd50eb25345bcd0bbc54090fe615f13620aa09ee52ad9200a8c74b04687d1affd7663eb60cd7387f321325f7c8fd63de8c')
b2sums_s390x=('e88511da02af05f6e6a3b62582cade46a6b7812f95b864fa665e90bfc508523405703c4775c91a44c493b63e9e19f0e9ae63d5930c1d3f6ca95ea4b23874ff57'
              '210acf80909566e154991ca52b0bda46922db0b1f8560816c0dbffd55e15273a4d1ddc0a1a1253ee984bc4bd1af437a0ac2a5bbc1f317b64ddb4472812e2272c')
b2sums_x86_64=('9c97c788b7921c41bc96a77245444153987770d528e92e87a6687fa5f8e5f52b88b805ff83193d6705fc17fba34adc043c64348a261d25a0d1591335d12dde9c'
               '1f94953c2bad76e7dd2ebaa5b145621842b11232677d0ebf46d2a8b18fd9639b2226346f1f85e4b5d1a7baf8754d14575810debbc6ef8ab354aa71d9022164b2')
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

