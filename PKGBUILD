# Maintainer: vcup <me@vcup.moe>

_release_url='https://github.com/ThisSeanZhang/landscape/releases/download'

pkgname=landscape-bin
pkgver=0.24.2
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
b2sums=('67bb93f0aac7a3722642efed0a827edfaa7a7f63d215b6fb29bb84920c07f79518353ef45ce7f1083d3240dda9ebb139fb516787ec8c633ff6e8566c3191d1da'
        '1e559d4cdf514c4168f09f4589b5f1ffd0d7d6d5ef84a454c923c5e449773988fc0d570a21e05b6fea629f1b8ab34bee3a7701489e5553742939f5b3a403f6a6'
        'f227f1b2d224a77b18fc96417ff23afc9db8f47894cb4e7c5cf107b795117426fc24db9c24cd7764f0af5092ec11c101843ad7cd4aad08ed3dcf5b541b63bdf6'
        '26badb43ef18e65bce3b5c1503d97969f6d10c18648c37d685e48ef0662fe24cc83a9a672e2904ccdf9038ec5feddc907af9e8404d1742ba150738b5978418f1'
        '8b513efcc4e5179e4e2843afe3a9b9f7bc801f55cd5cae8f4f41c9e02149368ecb3619b09b5810b08dbca1ce0603db414a7e70de5e130bdd51f736215298c057')
b2sums_aarch64=('5bc569f2ea8963c7fcc7c572c01eca9353ff9828f513dd610ce4ee2b64166e13c614fb612e80bfef1df9ba270a84c342231bdbac98a7a10263cf99674e112e96'
                'f702747e66f4622101010d5f0f8885399f31913eee09d9b834e6c8e9b2c7b988a1812a0220089c04ca8d05e337c3f6e96edb671fca429058178b55b5b4c877f6')
b2sums_loongarch64=('21d50b4bf32515255a56dc229752afd58f6df0625c691e271d51a127f41157ad3b747d755eb3bee53842f3a1d4d738570b670e5f1160059b9d4f60d9ee220aaf'
                    'd5b42fb4522a83199ca90fd409d51b6dd9669f5c0acaaef708e53f4746756f8df21e645e4e79a866d7b3305871e6069ea4d0dfe515b0a7d79450ab8145d1bf49')
b2sums_riscv64=('d7270bd8fd1bbb3fc188543a7b2248f628e142800f928251d2c89febeb7cab37bbeeb5a8a9e5f379a52466a21640a067812f5a0a4aab4d657191f0e92a3704a1'
                'fe67b8c11d396c73aba55d31cd3f790a53bd7b87db92f17e684c4a4f72317f048c7024a7d61b2ef54b624fb0961bd896a4ea4e651773642537711b2a1069f3a5')
b2sums_s390x=('9810d75a676cc738e8767aa493061eca16ddc498a8c12badbb953c1b446a1b43401bd8ba34fda3380a3829cde721623ef854c4df924c0baa5160a48be8e8831d'
              'fc1b5b483b14688dc011296c77624e4e31ca18474498ce6381f9676b457ce1b9036cff210c4ac5bda15db1988ebc4ee301acc92a82ee6c1fa9e088d39ee34284')
b2sums_x86_64=('a325a613713d755231fd113fb18e089af1a094111c288d0586a0399854f028b36173beac27a6be1e37cf953d230bb5b464a0b851d101aacaf3657f7fe34f2a34'
               '270439f43ef0ef4998470ed08b0a75f8dbdd2bd1ce4356b1b3e227de5ab5d67f1261b7c4a722fa0d0c6d2672bfc30408fe359f712d522d7ab9e80fc06e37bf71')
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

