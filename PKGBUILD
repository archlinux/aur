_name=esbuild
pkgname=${_name}-bin
pkgver=0.16.13
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

sha256sums_x86_64=('f245cccbf36c374abb76e6b37b9a1f09d23c7ff43c0f3914fd051365061bb93b')
sha256sums_i686=('54b44bb6231f4a6eadc119913e124cd3971d4cd7d51941a9db50856fa59291aa')
sha256sums_aarch64=('5009b0c17d203c2187ae26ca8ffa6cedc677770e7552abe7b131d878382b33d2')
sha256sums_armv7h=('ebf0f68fcccce45917d117941a2e40afeabc90f12f38e055b8ffeb0c357792d5')

package() {
    local bin="/usr/bin/${_name}"
    install -Dm755 "package/bin/${_name}" "${pkgdir}${bin}"

    local profile="/etc/profile.d"
    install -dm755 "${pkgdir}${profile}"
    echo "export ESBUILD_BINARY_PATH='${bin}'" > "${pkgdir}${profile}/${_name}.sh"
}
