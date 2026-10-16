pkgname=zulu-25-jdk-fx
pkgver=25.36.205
pkgrel=3
_javaver=25
pkgdesc='Azul Zulu JDK 25 with JavaFX'
arch=(
  'x86_64'
  'aarch64'
)
url='https://www.azul.com/downloads'
license=('custom')

depends=(
  'java-runtime-common'
  'java-environment-common'
)
provides=(
  "java-environment=${_javaver}"
  "java-environment-openjdk=${_javaver}"
  "java-runtime=${_javaver}"
  "java-runtime-openjdk=${_javaver}"
  "java-runtime-headless=${_javaver}"
  "java-runtime-headless-openjdk=${_javaver}"
  "java-openjfx=${_javaver}"
)
install="${pkgname}.install"
options=('!strip')

_zuluver=25.36.205
_jdkver=25.0.4.1
_sha256_x86_64='dc541c82220402985ef4f646246235a55920f4493d79670eddaf33fa45a5c73c'
_sha256_aarch64='5485d8302d3ef7a4c8e6baf9f914b5698fe9602226bdb30e5a5dd0c7975eaca2'

case "$CARCH" in
  x86_64)
    _filename="zulu${_zuluver}-ca-fx-jdk${_jdkver}-linux_x64"
    _sha256="${_sha256_x86_64}"
    ;;
  aarch64)
    _filename="zulu${_zuluver}-ca-fx-jdk${_jdkver}-linux_aarch64"
    _sha256="${_sha256_aarch64}"
    ;;
  *)
    printf 'Unsupported architecture: %s\n' "$CARCH" >&2
    exit 1
    ;;
esac

source=("https://cdn.azul.com/zulu/bin/${_filename}.tar.gz")
sha256sums=("${_sha256}")

package() {
    local install_dir="${pkgdir}/usr/lib/jvm/${pkgname}"

    install -d "${install_dir}"

    cp -a "${srcdir}/${_filename}/." "${install_dir}/"
}
