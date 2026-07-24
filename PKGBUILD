# Maintainer: vcup <me@vcup.moe>

_release_url='https://github.com/ThisSeanZhang/landscape/releases/download'

pkgname=landscape-bin
pkgver=0.21.4
pkgrel=2
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
b2sums=('329a71611af76141f696be184a0fd0b1d9e5be236cd67a45440e6b9a5d745230f66fbeb078969e7322f7d07aea13f619b3a2cb5f2da7438fe75d4ab51fe87e78'
        '1e559d4cdf514c4168f09f4589b5f1ffd0d7d6d5ef84a454c923c5e449773988fc0d570a21e05b6fea629f1b8ab34bee3a7701489e5553742939f5b3a403f6a6'
        'f227f1b2d224a77b18fc96417ff23afc9db8f47894cb4e7c5cf107b795117426fc24db9c24cd7764f0af5092ec11c101843ad7cd4aad08ed3dcf5b541b63bdf6'
        '26badb43ef18e65bce3b5c1503d97969f6d10c18648c37d685e48ef0662fe24cc83a9a672e2904ccdf9038ec5feddc907af9e8404d1742ba150738b5978418f1'
        '8b513efcc4e5179e4e2843afe3a9b9f7bc801f55cd5cae8f4f41c9e02149368ecb3619b09b5810b08dbca1ce0603db414a7e70de5e130bdd51f736215298c057')
b2sums_aarch64=('b43d67312b154eb9d0c0bfb96db577c778c036ee9f35117ebd02c2c056e568ce7f3cb86de204c916fd5798547e565b9656566875a153530899beed4fddda75a3'
                '8440f8a72ddb3f30547f124ac36e15d558f352125ea1d871894d2930884800fe9d66c40b9a07a305dea7acb891477d66a32908a0b0cba593ed52b05cfa334008')
b2sums_loongarch64=('7ba2edb316f39ed9e3fdb17f2247a6ab41d27890d156d2c229a5053748822558a45437f628c2ec2209d3ddecbc48aacaf749be15d7541819fe2e7406c8889bee'
                    '3f53e27e0dfe444f7b03a46f26b6bb5cc773efe1d49b7cb2d4585dc173424a498be25e800a85b129344863e2f7713ef6ce4e0ef970e50f14e9d8b5e4b48fa553')
b2sums_riscv64=('254462ccf713b79f8c2e0efa59dcb469e82f94ae00795d83a5917499801d72f4ec78ae16241aa5bce9a5dfbcb42927d5840ddeaf15012e1567e59ccd0bb748ad'
                'e3a22b77d8b699a913a2dc6617ac2784f15dc6415942c4ed0b80145a7add2403f8ba0fb7c823b4b8ec81c1981006f22f61282183c9f8080cf6023c58231f0390')
b2sums_s390x=('91b871ff5090bc798c38214046e3cd55881732d15d244cf44a48c05957d165dd9ab6a9fdc483a06b65ab44282b4891bfddf8736751c91b9f04c2faf41d351c23'
              '7bf4ac77ddcaddabf4659aff2a2da9c86ad1911b92a73f9ba67d877187bef8c202ca7e625bb2cbbc2e0daaa6409ac29cafa6e19826a7fa61a58a8ec1248ab076')
b2sums_x86_64=('ae9ed147e4f1c4bea172be0d6ce2c9964469098920ed2c2222bd363e1ce5a8892adc78788a0bb1363ba7d1433e240e961d3b0c6ec69b5cc3b7d847e012217ad7'
               '5977cefc37cc86a13efcf3e26e12ed8c22c3dcdf38719798d848bd496843a0c26601a71c271c7db53bc01d1d6b2c2666d88d1c40130836241ab90e7bad132ff5')
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

