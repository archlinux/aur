# Maintainer: vcup <me@vcup.moe>

_release_url='https://github.com/ThisSeanZhang/landscape/releases/download'

pkgname=landscape-bin
pkgver=0.27.1
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
b2sums=('b3e9e465f57c0ae42327f324090661abe6f445098895faeb6d58bbd27f4765e8284d9fecbaec6391bd2946fe85c55633f9cebc896442e24aef4ac930bc492427'
        '1e559d4cdf514c4168f09f4589b5f1ffd0d7d6d5ef84a454c923c5e449773988fc0d570a21e05b6fea629f1b8ab34bee3a7701489e5553742939f5b3a403f6a6'
        'f227f1b2d224a77b18fc96417ff23afc9db8f47894cb4e7c5cf107b795117426fc24db9c24cd7764f0af5092ec11c101843ad7cd4aad08ed3dcf5b541b63bdf6'
        '26badb43ef18e65bce3b5c1503d97969f6d10c18648c37d685e48ef0662fe24cc83a9a672e2904ccdf9038ec5feddc907af9e8404d1742ba150738b5978418f1'
        '8b513efcc4e5179e4e2843afe3a9b9f7bc801f55cd5cae8f4f41c9e02149368ecb3619b09b5810b08dbca1ce0603db414a7e70de5e130bdd51f736215298c057')
b2sums_aarch64=('e5964964855776d0421e66dad7391d4fd9ee003a28cd79b3c6ae91fddf2dbf2b10bc154c320adf2fda86e36cbf8387e7e24238001d1aecd33747e51657f354a0'
                '4c0b12e757eebf3bcfb8a574f997555e6010af9671039c212129293fe3e47356cc3a0a9ea5d108dc70487a04f64726ee23d0e218fafa7b16e3b18493da3ebef9')
b2sums_loongarch64=('088c61a5a46ed3c027c158caf6a285fa46607d99bd8eb7457bd88a7e529ebc8428d92bc85797ed17a9cafa70b98b4e3ae2efd827e3abfd34aeab8db1a6a3a07d'
                    '5cf69ee03ee6e78a202b5475908088fc3c3b2efb8f6de6007560bb862938945e239c6c9e45138a4a85450b8d2f766c01629d8ebebfab9014622c16eacd667541')
b2sums_riscv64=('8e7d18a1b7d461e20aa820511c2818db108646cd217eb65f11f7dcf36228bbfe69772afee51bff9fbe63994ef7df51420a90ec7f0c403113f84ef240d0ceed7b'
                '6da54d4bbb0362895010bd44d828a8d2e16dd217a91845e0d1cde9e873d37f979e64565767ef60e8c5a66179d56d5b0186d423d7982f787fa9b9fc97563b8954')
b2sums_s390x=('433418ea2c643671fc9767960323ac1f10a9dfc1a9c3f261313912f5a8d84e58d54403efc4a638f1e118906c7a0c63b1b9f8ff55f103f14818c135210141e5e4'
              '028fa55e237c7f1237022de6280788d10a1e46f81dd176d11af6f0faaa8938335d8044a1729a03cefc8187ae93b61f68d7bb593c8e10419e7984b73db5436cf6')
b2sums_x86_64=('0ab4899a0a45db464fa8086d8e78c5caec160b78a5b7b0ea9c1fca36fd8c110ba948f93d23486edde8661fffb3ec5b0395d93aa4a341e26a858666c4e4c8e556'
               '3172956040c3333bbd5b126c15037e6daabe4ef2e8b97c3a6d331a01484b3c0bdc504715061e6ba61ffeba3900f7a7a6d65757807e2960a39f39cabf7068cadb')
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

