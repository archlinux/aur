# Maintainer: vcup <me@vcup.moe>

_release_url='https://github.com/ThisSeanZhang/landscape/releases/download'

pkgname=landscape-bin
pkgver=0.23.0
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
b2sums=('c20e9a4388c18f0b2dd87a023c69292ce6fa3fa11793e29ed58a04f81b55371be2fb012c00586ac8ea54c5557c5e3a9ba9fab9f9797e7af89b820081d3117b90'
        '1e559d4cdf514c4168f09f4589b5f1ffd0d7d6d5ef84a454c923c5e449773988fc0d570a21e05b6fea629f1b8ab34bee3a7701489e5553742939f5b3a403f6a6'
        'f227f1b2d224a77b18fc96417ff23afc9db8f47894cb4e7c5cf107b795117426fc24db9c24cd7764f0af5092ec11c101843ad7cd4aad08ed3dcf5b541b63bdf6'
        '26badb43ef18e65bce3b5c1503d97969f6d10c18648c37d685e48ef0662fe24cc83a9a672e2904ccdf9038ec5feddc907af9e8404d1742ba150738b5978418f1'
        '8b513efcc4e5179e4e2843afe3a9b9f7bc801f55cd5cae8f4f41c9e02149368ecb3619b09b5810b08dbca1ce0603db414a7e70de5e130bdd51f736215298c057')
b2sums_aarch64=('7828630b5951e526fad5db0d0453ee73674b978f27d149c442c5e07988a2c44cf4e9e8f0aefb90ecc8000eda3a2ce3fee94c8a00c45d25c0c8013f9fb43976c6'
                '59ec238765bcba9be23319288ec26f50825d2e2ae6e3f992c0584b4cfe251c562d369e2908e84a71548b14b1ea74cee0438ccad05888e4c2902e633eb03be58b')
b2sums_loongarch64=('307eb28a6b28a8dc9ae79d2275ab87476804136a94dea0bbb283d34d8965586d2c9311a862b2ecd2c9001e3b6c6ae1688d37a5c146be69457e6656f59c9a81ac'
                    'b99a4cf5b858a87a1d650a72885652881bac10a60b6ed8d3ffe98bb601bd7e89cb115daecdf6af53f01079fa6119a1addbfe82cb29303ee24b31b9d61c951116')
b2sums_riscv64=('2e4fbcd867c29f7a3e4337c5f1b09c9decd11c14710fcf339e1db246766331b5f03cc0c864a9dda0d85e7943565150e540c2930a2ddc72e8915a069b39c4969e'
                '2b74a38f090493e4f80847902c6dfb1c36d6dbbcb5904880f8f896867a7d0998baf49c30e12d46667fa5c9b22e6867297c3ba0f6a7b5c8d56b6b2280d4d381e6')
b2sums_s390x=('e862611ae0b901655195aecd13c9ee3ed430133b11c3f12b883b0d08a57180d47385fc18ba801c22997fa47fb6f52df0f96d6524bfc39de6f7872f15abecf7ca'
              'f81413fddaeff0c71e493437a722a35363cba4c87e3d6fffb0b046588f68b48bb30045753ff337b69b771ef179b5b5437958a39ff88b2c05d880d9d0c47fbf8c')
b2sums_x86_64=('7f278034e5cab3dae44af8dcb4eeb584fa45da7dd508b81ac61cd6fc4c464717d301deee0633582034e0a145cf6e75a2e297b784347c5f34749beccd7ec967c9'
               'e47830f5ad8727af562f08dcb04f27dccdd5baf9bc498519c75190545ad8c4a3ee983d2efeac3fab3bd2c575431753a8d3d51fed624d539de4e0332fd77b6c45')
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

