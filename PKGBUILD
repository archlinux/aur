_name=esbuild
pkgname=${_name}-bin
pkgver=0.16.16
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

sha256sums_x86_64=('6ad0a755e730af21774b5beb1ea548b18ca102b948afc27688c2adeb357f72b2')
sha256sums_i686=('18811cef8a427edc0653abf5d1e4ab52b1e60e55a3088662445f8289559c98f9')
sha256sums_aarch64=('d1c69b97025858df602c244b25f55834b290ba234cffb260b633af3ebcc42f99')
sha256sums_armv7h=('07180bca593d55e07978edf8ce9e3554324e8cf1dcdcc19c62abdcb369fcda19')

package() {
    local bin="/usr/bin/${_name}"
    install -Dm755 "package/bin/${_name}" "${pkgdir}${bin}"

    local profile="/etc/profile.d"
    install -dm755 "${pkgdir}${profile}"
    echo "export ESBUILD_BINARY_PATH='${bin}'" > "${pkgdir}${profile}/${_name}.sh"
}
