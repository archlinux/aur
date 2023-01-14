_name=esbuild
pkgname=${_name}-bin
pkgver=0.17.0
pkgrel=1
pkgdesc="An extremely fast JavaScript and CSS bundler and minifier."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://${_name}.github.io"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")

_get_source() {
    local npmpkg="linux-$1"
    local archive="${npmpkg}-${pkgver}.tgz"
    echo "${_name}-${archive}::https://registry.npmjs.org/@${_name}/${npmpkg}/-/${archive}"
}

source_x86_64=("$(_get_source x64)")
source_i686=("$(_get_source ia32)")
source_aarch64=("$(_get_source arm64)")
source_armv7h=("$(_get_source arm)")

sha256sums_x86_64=('e170e436f83a6139826f6c6c01f98f08e0af29ea7adb3778ba9dd5dc4d6da8cd')
sha256sums_i686=('7627eda6a2eaf654331256abb83558715b3afd04e5cbb0ed61d72139baf8b519')
sha256sums_aarch64=('9bda92d85337be3499f9cfce7dbbe3dfba123b03f93829a354d9b933cb742bdd')
sha256sums_armv7h=('ea9e66a2ccbfa5d6ad691d18383aaade4d744459f6d2111fdcb6e076de258669')

package() {
    local bin="/usr/bin/${_name}"
    install -Dm755 "package/bin/${_name}" "${pkgdir}${bin}"

    local profile="/etc/profile.d"
    install -dm755 "${pkgdir}${profile}"
    echo "export ESBUILD_BINARY_PATH='${bin}'" > "${pkgdir}${profile}/${_name}.sh"
}
