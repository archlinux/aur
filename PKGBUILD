# Maintainer: vcup <me@vcup.moe>

_release_url='https://github.com/ThisSeanZhang/landscape/releases/download'

pkgname=landscape-bin
pkgver=0.28.3
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
b2sums=('d77fe7d72d9448a1e30e2f16781060e8b1d5446a223293daf6ec3780ece84df619530cc976920e18109da79110a6202035aa74755598ae67b314fabdc8c1cd3c'
        '1e559d4cdf514c4168f09f4589b5f1ffd0d7d6d5ef84a454c923c5e449773988fc0d570a21e05b6fea629f1b8ab34bee3a7701489e5553742939f5b3a403f6a6'
        'f227f1b2d224a77b18fc96417ff23afc9db8f47894cb4e7c5cf107b795117426fc24db9c24cd7764f0af5092ec11c101843ad7cd4aad08ed3dcf5b541b63bdf6'
        '26badb43ef18e65bce3b5c1503d97969f6d10c18648c37d685e48ef0662fe24cc83a9a672e2904ccdf9038ec5feddc907af9e8404d1742ba150738b5978418f1'
        '8b513efcc4e5179e4e2843afe3a9b9f7bc801f55cd5cae8f4f41c9e02149368ecb3619b09b5810b08dbca1ce0603db414a7e70de5e130bdd51f736215298c057')
b2sums_aarch64=('29f983d4631113324ea591771cbd3cc49b1ba9ea790744de8a3ffc551dc6bfbefa3ecfe06586b093a004b876e67a37348fb03c855744cd583aeb0e6b15f30c2c'
                '7ba75cb1395122fb12961b5cfd965d6708ac38c7e9243a8728cf5d7ed7822ade1d5224c795e644a85409e07dcf4b9cf02b1412d82b2c917964c6e9e136c2bafc')
b2sums_loongarch64=('f52ce7b18bee739ee24f280bd6cdd0d8aae0af5cdf1942e97c64b27909138808e347f4e6818d2f9cac5c2bfa113a3f7a7c6f6ac571cdaa118240d0ba40d12b69'
                    '30ef02312c55dd23c84869c5156dfbcd64b74564ced38ab19449bef7816516ba8497a33f233aa11c3ad3e68557db1099bd142608fbfff4bf303abde84c1791c0')
b2sums_riscv64=('112d900112c7e6f016a8f7ffefae64966f2dae68ea2c85774554ca079acb992a63f5eca1052ad238f81883e43c1647053860a755a75217c1ca563a5319fe0e16'
                '8ff2265a5f0e0fe1520e8add15e250dfffd49571afbbe587e763333273b52b5e9b6a8469ab9d37793a8337f92dd467952effceea9e323ce82df9cf137e4ccf23')
b2sums_s390x=('f4d9808237cd88aaef35880df4e42c7e734bb7f3e0c1713a5199da5b2abc86c41c14a07b6cd6f706d25f79a6a62856fc86d876f9ec95b380bbaf2a63f48d1bbf'
              '1ed4f3591292ae855e35f14c4572d6a94905938fb4df955867b1f17dcf13946b247fd4f1fdb01f8f435e588279c41a8aea689a7a20e45fef93aeb07f6af4a84c')
b2sums_x86_64=('7cacac286640bea5b5adfc8967044fa6a92a229710ee27cf5b4ad6105402fd0c0fc597028e42e4976908a1445cabe2959b2368d567411b09aa24d4b58138e979'
               'f8bb4795761da04c7ed880794a20a4f7014c206a28ca99361bebf2d54d97c01c7e77f7f934cb305a8f2dece59f91142b2b22f110c9707c2d458ff6c8b74087c9')
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

