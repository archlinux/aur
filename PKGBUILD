# Maintainer: vcup <me@vcup.moe>

_release_url='https://github.com/ThisSeanZhang/landscape/releases/download'

pkgname=landscape-bin
pkgver=0.25.1
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
b2sums=('fd8afdca2ff32439078feaba2dfc95c2234646530c149b175441d0a93f15ff25eb9876ff7730749aff3d3d79c209f3f4133c5c07c5b04ccce7e526f48db59cd3'
        '1e559d4cdf514c4168f09f4589b5f1ffd0d7d6d5ef84a454c923c5e449773988fc0d570a21e05b6fea629f1b8ab34bee3a7701489e5553742939f5b3a403f6a6'
        'f227f1b2d224a77b18fc96417ff23afc9db8f47894cb4e7c5cf107b795117426fc24db9c24cd7764f0af5092ec11c101843ad7cd4aad08ed3dcf5b541b63bdf6'
        '26badb43ef18e65bce3b5c1503d97969f6d10c18648c37d685e48ef0662fe24cc83a9a672e2904ccdf9038ec5feddc907af9e8404d1742ba150738b5978418f1'
        '8b513efcc4e5179e4e2843afe3a9b9f7bc801f55cd5cae8f4f41c9e02149368ecb3619b09b5810b08dbca1ce0603db414a7e70de5e130bdd51f736215298c057')
b2sums_aarch64=('124ecc358a6f60eaf7964ead76cb7e3dbe3d6e013fc2fabc2133358444365f249451d588f742ba6518bec45c2de7e942448dbb7ddc03a1b6bcf8cae8c59e28e3'
                'f04db7558291cd32290938495a880d1020da699e8f0c80034d07b3a6457cce500e3884e2e734ebf7516f07aef970d2a5415da21d70a6d2383a4f3ff7bd50edc7')
b2sums_loongarch64=('85b27c4a3cdd0275b4909beab3d50e88c51bfc93e67fe625e6d823616659df0ef1840ee392dc9b62cb03796cc8f1dea22d0eceac219fcd03fa14156ebd8c5b0a'
                    'a9de0ca32357edd21d574c366edf900a5e793b40f000de842f51b8032ffc3be70580168a48abaa45c5131bf72cc011062ddcf20bcba4a29e03f0cb8a37a116c6')
b2sums_riscv64=('45a30561c051b46db72a3d597a9ebb286203bb7c29ef611f5c4de21e216833988db19cb91793ef24c7195c46724e96de5ac390c1654dcab38ad0ff64ecd6415d'
                '932d60ea93473228d509420fdc2c12ed073597f99c75b0990ea4f06c1ba89cb6f81b743b9fb3b64e2bf7f6d772dca09d4124c6ff5a78f12e029f4e1f09e4c3ab')
b2sums_s390x=('22a6c73c3edf6695b8e0257af3e0072b6b70b910a089c4c992491a301ca7ce7cbe5bea6c5f4af2a410f6db172693853fa9fd8538eeec6aa795e8ed6804c97cc2'
              '1a75f23e3b1995414c18f7db3178296fcd0bf708f5b8f0ffaf46f10d405ea400fb9a1f3856e5649927498609ae25976543f6e4d1cad937cfc15d57639c210138')
b2sums_x86_64=('319ca508cb46b37772291e002e9e3ae11f27393e3188c17f3c02f94ebb5e86c4c42ad0e1f257e20243985377b2e351075e4a720abdb976a2aa361a56160a035c'
               '1d379706c7d4b0b896923d1e454abcc54fee7bb9ee37046d4dc7d6bce9fcb6dadeb2ab907c8e2b41aacc2ed4d3ec7a6694d7a374325944312dc61d5dd0c84a8e')
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

