# Maintainer: vcup <me@vcup.moe>

_release_url='https://github.com/ThisSeanZhang/landscape/releases/download'

pkgname=landscape-bin
pkgver=0.17.5
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
b2sums=('2427fa6c04263c9a9ea30f6c62f2cf84913be71b7d4705ddc8c457ff1a243994f583670d58edf2a9132bfa491e51eaf1e92bec76b268f0e60f52154efb8b6880'
        'ff6364bb93cfa43914043802d5905b7b2c74686c432511b1bab2e074a924c9db01de4a95ecba04d74f9d469b97229ad909e58c58edcea0279bc83909fba0dd6c'
        'f227f1b2d224a77b18fc96417ff23afc9db8f47894cb4e7c5cf107b795117426fc24db9c24cd7764f0af5092ec11c101843ad7cd4aad08ed3dcf5b541b63bdf6'
        '8dcc5aafa2c9a53f1f010e5f344123a193e8869ddd734c019b0a4f2f816f664ca8d0942d0daa661eb579b3dcc32e4616e2b218b7cd8d945f32ccbc9b555bc3a8'
        'd5b7bf2ea0fedf848ca73baedb7c796b14d2b5b3e754c4bb4c0fe42a5aab3766f35d8620fb8fb34cfb900d3e4a3fcc5351523ed838e0daedde260e1ba6e115ef')
b2sums_aarch64=('ca20303be580a9c4bd69dd8ce3336bbefdc40f787198c56bfbc320851ecb7ee874d415cdfbda3adacb267184034b7a786e000b26b259611f2fc24e3f76b95f56'
                '18626ecaa18814653c850ea6517c579d9f3dcdfb4ec9068f14507f310bbdd082d369d7fe0a4abe765a8ba436680b46863bfe0926395c40161ac6ba87e1ec3e4b')
b2sums_loongarch64=('cf3c3f7fb70ef35bde40157ebb51804ca40d95690516a7700c03360e34bbf5366db2b9a03a841be53bbd95ccdcf0d9b981938464511e4a1a4724b8ec99464dd9'
                    '9be0e36d08eeac16ec58714f7c907fb448fa336b8b6242dfb193d3464a9dd77b6f66e57d7a119bf16b595611715a753fb325396d643b296ddc1ffe33dfaeda9d')
b2sums_riscv64=('19160752c72c201db44f425701ec5c5a49c6a17eb235b4e870d61f195ba4ec6f905a3893f253805dfc6dc1e23ea64cde13cc96b12f85899798d6f0deb206482b'
                'c9a11faa9d0da1c32cd7cd5623de4cc2e05da06f50b5e8292d1a121877488af5afee4e22720b6b87ca5135dc1de713246d63e0ea09a4bb86a0ab84e659d30fca')
b2sums_s390x=('5716f0ca1b821bebe37c4acaa84db9d72be177e19a9d9bdb5e88e791d0efa87479005f523dd358fae8631cd23e3c7d62f52d1011d64af15ccd78d4957af8f959'
              'ece10095a74fad99a656dee298011dba8111a1ec93489a80537b6507782fda7b20ca876d27a83eed61c2130ee2eb7680917996dc74c6fab760fbdb700756e9de')
b2sums_x86_64=('ec09be0c7b0bd4c27bc1c48151a3dedf85cd1a7a80fbbfe895b0d5624b230c42df161815f9e38a34063d737d35ac4d87fee193464ab7888d75dcb7471d75e501'
               'd9e5a5b7c9589929173adaa762b4d2d956f06d07db7c517890bce6d6b06e645f55f26aef1bf574a33d85dd76b453cf1b266803912fc1a447f0de48e16f038eb1')
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

