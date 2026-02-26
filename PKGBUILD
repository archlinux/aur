# Maintainer: vcup <me@vcup.moe>

_release_url='https://github.com/ThisSeanZhang/landscape/releases/download'

pkgname=landscape-bin
pkgver=0.14.1
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
b2sums=('a296e80c0e92b0607b1628cd1e239b5bda4ec5dbbabc589c73fc3ab3fd03d41930acf90267891d6e176e3fd36e40c0c64c1447d9a7f433fa6164a62aff415e7d'
        'ff6364bb93cfa43914043802d5905b7b2c74686c432511b1bab2e074a924c9db01de4a95ecba04d74f9d469b97229ad909e58c58edcea0279bc83909fba0dd6c'
        'f227f1b2d224a77b18fc96417ff23afc9db8f47894cb4e7c5cf107b795117426fc24db9c24cd7764f0af5092ec11c101843ad7cd4aad08ed3dcf5b541b63bdf6'
        '8dcc5aafa2c9a53f1f010e5f344123a193e8869ddd734c019b0a4f2f816f664ca8d0942d0daa661eb579b3dcc32e4616e2b218b7cd8d945f32ccbc9b555bc3a8'
        'd5b7bf2ea0fedf848ca73baedb7c796b14d2b5b3e754c4bb4c0fe42a5aab3766f35d8620fb8fb34cfb900d3e4a3fcc5351523ed838e0daedde260e1ba6e115ef')
b2sums_aarch64=('91730fe5dc349ab1e16290d2e8453725412ade8f3086c46e69bbf8be18f5a119048b8460a56f06b219ef36fa59c558b87f29734ecdc11206d725226199a302ee'
                '8b4f0d6f027b98039e1733f09f6015ed8b3a36563303d63f0060f2b076118986790263f5c75fb755598757dbdf587ffcf2cdca8290b9732796b56373d051b012')
b2sums_loongarch64=('a00998118c25c6fa2ce6a0a539eaa4931e961fac81825b536bc1fcd0bb0fc15be5ecdf7c354e1e8e9caeaa616a99f7faf96f4d99eb08d6d56593c743e7438b94'
                    '422e5de607fcfffeea52e0754d2d609093da53a3c1a506e6a5e0f13bde8f3b99f7c256cba0e1f0cf9e5f5e699600e9c47608a519b06ecd813926ae8cc93f60cd')
b2sums_riscv64=('1d85f0afe7a90072e8b074b5937b82912f6c8086f86162a7f6181806fc47c842f08040f9150a27c611f3b6e5a6096d8e4f8e11695ce9561994075b115ff49c8c'
                '9297ace0338e9517f9006f54940cdde5b31701d68debc5e57b8b2c7ccb9ae66e1d8b76e9e91eb6fa5f426e66af45e6c83864266f023795a37ce110f46c0854c7')
b2sums_s390x=('79139798f23f5d9567ac2f789b2c34caf6d1d1355cbf4e680baa226cace033c9747c99ea08036c6b178efb803772a48d7f8a895277be08ad96ba18bd669c48c6'
              'd83e3236df337f6b44e7cfb6f6345fdfbc3787769eb39533916e05b01a3ee1812cddd00bcdd6b8ee433c53b7a99549730fbfffa5520825f2ebd386191ee5a2d8')
b2sums_x86_64=('43e2df05d8665dab353f7ad4df27d181c95ff9e87ab107ddc6af37a66581be07c6bafb88d66b6d1edc224f0f2500c3dfd6c7f79e62c9b8ea089a6ce5d1ea9164'
               '227cf3f5fdc418e840a0fde7c395d452f5d04fb23b0a8182b02306741a7d659dfacd982da4434f30db6e3750fc059196a91ace2f9394967dd5dcd4b83f7a2e60')
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

