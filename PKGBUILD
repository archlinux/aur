_name=esbuild
pkgname=${_name}-bin
pkgver=0.16.15
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

sha256sums_x86_64=('68fd28af3e959bc2ef64f66cc177e3aeb8bb1fcf6f5b0c12991d4cd4f5cadd22')
sha256sums_i686=('2e125bc781a37de769ab6fd433826d97d697ae25841b5f6fd90163d7f54f0de4')
sha256sums_aarch64=('073dc6010ecb4f99c5e92169b6ddb1344e6ce600e5ae2f8d172fdb3df0418a56')
sha256sums_armv7h=('fb01769f8898160eac12172fdb4fa0da61a60b8f11991f75f4ef8ede2988abb3')

package() {
    local bin="/usr/bin/${_name}"
    install -Dm755 "package/bin/${_name}" "${pkgdir}${bin}"

    local profile="/etc/profile.d"
    install -dm755 "${pkgdir}${profile}"
    echo "export ESBUILD_BINARY_PATH='${bin}'" > "${pkgdir}${profile}/${_name}.sh"
}
