# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="ioxclient"
pkgver=1.18.0.0
pkgrel=1
pkgdesc="CLI tool meant for assisting application development for Cisco's IOx platforms"
declare -A _arch=(
  ['aarch64']='arm64'
  ['i686']='386'
  ['x86_64']='amd64'
)
arch=(
  "${!_arch[@]}"
)
url="https://developer.cisco.com/docs/iox/what-is-ioxclient/"
license=(
  'custom:Cisco EULA'
)
for _carch in "${!_arch[@]}"; do
  eval "
source_${_carch}=(
  'https://pubhub.devnetcloud.com/media/iox/docs/artifacts/${pkgname}/${pkgname}-v${pkgver}/${pkgname}_${pkgver}_linux_${_arch[${_carch}]}.tar.gz'
)"
done
sha512sums_aarch64=('bb062c0b0de0f69741e0f62248280423782a4d0de8afa83a9554f0f38007a400a19a881945106f646670965915744b91a9894694c6a37b0481469019c320cf39')
sha512sums_i686=('504943e55b3c9d3b9e291c25fa2373faa5b17e42eff0c151e2b61569025c4bb81d7003d4394b1ea56d0714bc44f21e19420946127eecbbd5ac66012fa73a6aaf')
sha512sums_x86_64=('716589ece24aa891d0cbc00460e9cf73ef783a8f1eb6b0f615f886eccf0c1c8252d8490918e353a5e358138eac2805fc53d5bf6fe7022606cde9b143ff3f2d59')

# prepare() {
#   local source_array="source_${CARCH}[0]"
#   local source_url="${!source_array}"
#   local source_artifact="${source_url##*/}"

#   cd "${srcdir}/${source_artifact%.tar*}"
#   chmod +x ./"${pkgname}"
#   mkdir -p "completions" 
# }

# build() {
#   local source_array="source_${CARCH}[0]"
#   local source_url="${!source_array}"
#   local source_artifact="${source_url##*/}"

#   cd "${srcdir}/${source_artifact%.tar*}"
#   ./"${pkgname}" --generate-bash-completion > "completions/${pkgname}.bash"
# }

package() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}/${source_artifact%.tar*}"
  install -vDm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # cd "completions"
  # install -vDm644 "${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
}
