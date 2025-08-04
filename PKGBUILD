# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="ioxclient"
pkgver=1.17.0.0
pkgrel=1
pkgdesc="CLI tool meant for assisting application development for Cisco's IOx platforms"
arch=('aarch64' 'i686' 'x86_64')
url="https://developer.cisco.com/docs/iox/what-is-ioxclient/"
license=('custom:Cisco EULA')
depends=('glibc')
_pkgsrc="${pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::https://pubhub.devnetcloud.com/media/iox/docs/artifacts/${pkgname}/${pkgname}-v${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::https://pubhub.devnetcloud.com/media/iox/docs/artifacts/${pkgname}/${pkgname}-v${pkgver}/${_pkgsrc//-/_}_linux_386.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::https://pubhub.devnetcloud.com/media/iox/docs/artifacts/${pkgname}/${pkgname}-v${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz")
sha512sums_aarch64=('fbba9a5d68cf569b664ebf29a4c6ec0ec0471628e738c5b69683c33fda16799dd96431f07792831bf4e9a42bb83c82a5006c63977bb21dde33234a5306e915ea')
sha512sums_i686=('9bc48dbc86d62352342a6e7f43001f41a45a291594d5ae4f48afb2e2ecb7cba6445ad043c43c318fbe9399b75b8539128d7c3845051fb44043c70cbbeb49eefb')
sha512sums_x86_64=('30ae95e692534c1875864e830f7a183978e0e30d630a7aad52455fabe1a94d382b5395e49ea8f0f0eb38e6cac229c6d7406afdcf059a1be8d5996fd5746c9043')

if   [ "${CARCH}" = 'aarch64' ]; then _arch=arm64;
elif [ "${CARCH}" = 'i686'    ]; then _arch=386;
elif [ "${CARCH}" = 'x86_64'  ]; then _arch=amd64; fi

# prepare() {
#   cd "${srcdir}/${_pkgsrc//-/_}_linux_${_arch}"
#   chmod +x ./"${pkgname}"
#   mkdir -p "completions" 
# }

# build() {
#   cd "${srcdir}/${_pkgsrc//-/_}_linux_${_arch}"
#   ./"${pkgname}" --generate-bash-completion > "completions/${pkgname}.bash"
# }

package() {
  cd "${srcdir}/${_pkgsrc//-/_}_linux_${_arch}"
  install -vDm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # cd "completions"
  # install -vDm644 "${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
}
