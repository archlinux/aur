# Maintainer: vcup <me@vcup.moe>

_release_url='https://github.com/ThisSeanZhang/landscape/releases/download'

pkgname=landscape-bin
pkgver=0.15.0
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
b2sums=('10a6db56acedeaeddb768f5086e57b93041c237270b419725fa7bab60235ce33ed1731b30a55c5ada24e9f856048f2cd37bc7695927292211269ff579d354994'
        'ff6364bb93cfa43914043802d5905b7b2c74686c432511b1bab2e074a924c9db01de4a95ecba04d74f9d469b97229ad909e58c58edcea0279bc83909fba0dd6c'
        'f227f1b2d224a77b18fc96417ff23afc9db8f47894cb4e7c5cf107b795117426fc24db9c24cd7764f0af5092ec11c101843ad7cd4aad08ed3dcf5b541b63bdf6'
        '8dcc5aafa2c9a53f1f010e5f344123a193e8869ddd734c019b0a4f2f816f664ca8d0942d0daa661eb579b3dcc32e4616e2b218b7cd8d945f32ccbc9b555bc3a8'
        'd5b7bf2ea0fedf848ca73baedb7c796b14d2b5b3e754c4bb4c0fe42a5aab3766f35d8620fb8fb34cfb900d3e4a3fcc5351523ed838e0daedde260e1ba6e115ef')
b2sums_aarch64=('4bc31f10256b5856b547a2f4f01694b35ff14e8d58fe096ed1e7325f16e2b8af3e8ecb4f764d2010a449f279f1f177aeb3d26176240e9bb5e578749d2bd3ab61'
                '961b69d4075be48cb44953fbb0e0f36b88430321fbec4c630d8b62d9cafb7ffae4209d058d5317a0aa7a268a32ba9f9c40caf7230b10d21a8355cb802c3933e2')
b2sums_loongarch64=('d55c70900d3a85e5c05030895de601adf5ecceaba007e158c721a05c0459a0a96f6a7043f2e990bfa9a7a58c4b3c1f473a1b9188acbe9c2da7c93b1354b7edd7'
                    '57fe78496398b14254cb195a15c79f088f4eb7d17052ca78e41f110ab70b6bd3befd11deff9bbc184dc7029c6c5c06252e23b6cf0d1f97cdcc8ab276cb9b5565')
b2sums_riscv64=('ed5d34d514ebdcf4ac340c6518aaab1900e14416c1d1046c911e146be3772f90f7dca293dfacc15dff27b9eae990644d096e3c5963f205a46fb7fd1173243102'
                'ca69fc177381500e2fe4bd323256f497651668413e0054fc073be683e9ff7d85f674ae186c9cc08265616d6ad30d3820c78067c48099cc6bb5670c3829050e50')
b2sums_s390x=('0a80f649798f2b5ca92616180e0971b5cbbcfb3ee85019dc19c11c8396fa9ca4aed24d7fcd0efbe5cfdbd6946fdbd4c68b853429d948339aad1f5083f067c785'
              'a6cb74b027deaad05f344b1273f77fa9fd36b5e79bae024dfab0ef81c9b62883755f0ee86588ea290f2eccee16d6f9870a1bc702e46d8f24303fc76a268ff138')
b2sums_x86_64=('cc07e8a415b5636ec395d626c14bcb38415f1dbb0b2f322f79db3b25db3f15f551fa735243fd1f2e2d5d100f50668ae3dcf44cd5e502306aac856c6b419aceff'
               'afdcd4a58c2432ed4044905e0a06edbf99c7f7c3a3ebf4705a76a7f9a1548170774ba7d37000022dc1801c58126294ca375d5c292e55cc3daf5ac683d581a8b8')
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

