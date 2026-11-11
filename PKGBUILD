# Maintainer: vcup <me@vcup.moe>

_release_url='https://github.com/ThisSeanZhang/landscape/releases/download'

pkgname=landscape-bin
pkgver=0.28.0
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
b2sums=('6114943876e9af8c246e574786e5555691a00809f46ca5fe8d17de2e261eb025925f6ea62c7cd5194710670905937dee4c2c05c073cb3f6dba36f65ae7f0dede'
        '1e559d4cdf514c4168f09f4589b5f1ffd0d7d6d5ef84a454c923c5e449773988fc0d570a21e05b6fea629f1b8ab34bee3a7701489e5553742939f5b3a403f6a6'
        'f227f1b2d224a77b18fc96417ff23afc9db8f47894cb4e7c5cf107b795117426fc24db9c24cd7764f0af5092ec11c101843ad7cd4aad08ed3dcf5b541b63bdf6'
        '26badb43ef18e65bce3b5c1503d97969f6d10c18648c37d685e48ef0662fe24cc83a9a672e2904ccdf9038ec5feddc907af9e8404d1742ba150738b5978418f1'
        '8b513efcc4e5179e4e2843afe3a9b9f7bc801f55cd5cae8f4f41c9e02149368ecb3619b09b5810b08dbca1ce0603db414a7e70de5e130bdd51f736215298c057')
b2sums_aarch64=('82d6526e6098f8d0f1388d786ceea30244ac9b1b9f92307b5318c8549ba3f180bf4a195f82938d32e8334e500616ba0108bfc743bbd56b7a978f89cc2b2a9cb4'
                '98130e59354327a7cc862257e0951b5a441dad9b027fa429d9f147daed6eef2bf2df103197ffc2ab34ecbad93a45fd77ab10e1f5026e3af8c51512c67b8316b7')
b2sums_loongarch64=('178ffc21f8271b0e35f19aeb97ece9b657c819ecb4a760f7d63677c7e3d5d9f3da32d45c4f34183216d7d963418069d2c7f514fb7f5e596bf20f54b42abbc09f'
                    '4ad50a142386440bb9a8833c056f4f4e8171a7b81daa323af798b67b41e06972e408da788f76ac9a8e4314331ef711275fcc6eb25cd6dacbd37ca3730dd03bb6')
b2sums_riscv64=('d6d7dbf0d8f64b40a5b370dcb8f76a3ccf2bcfa39522f11e17608793d12bcf220430c7f034018997eae0208a006b56f1d068e115635416308c6a9b7bdee7e9e3'
                'c2a5f76910292b70211a73faa218b8736ba56d9f29f5f2eb629a65b234052d77191972edf3c0f00ecc8643a5cb640c651d98119d17a14f4f01b433f56a0b6686')
b2sums_s390x=('504730194e2b29e35a0fe66b86710d74cb96431de9995cd730d2ce7339aa5fd1361b9eaff738a0939193852f6a1fb07367a0f80cbd697433e100246e3fe289e7'
              'fa78ad8bc478dd3b7e01edde6a142dc6d4ee990e334119d1fa642fd82b34c65b2e640f219e3b8102f0f0c079dc1659756df9c433289de2df007454fb1711d4bf')
b2sums_x86_64=('a9ffd11740fade1ceb42db6c8e4df05182bc9fa2635bfa180038f40801ad1129947185f75bd5fd74eb430bef5d762f0931eba4d49baec3c7f32f743bee213c37'
               '5dd5da7ca112edd6d5b82711703cdaa29eaf5890fbee4b149f5ac1bdfadbe2fac487d9684bd640e806f49da5fb31c2f53e0949784dc1e69b4795db8d74e5b138')
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

