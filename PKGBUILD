# Maintainer: JustKidding <jk@vin.ovh>
# shellcheck disable=SC2034,SC2154,SC2164

pkgname=aws-lambda-cpp-runtime
_pkgname=aws-lambda-cpp
pkgver=0.2.10
pkgrel=1
pkgdesc="C++ implementation of the AWS Lambda runtime"
arch=(x86_64 aarch64)
url="https://github.com/awslabs/aws-lambda-cpp"
license=("Apache")
makedepends=("cmake")
depends=("curl" "bash")
source=("https://github.com/awslabs/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fee8e465ac63efaa6252aa2a108183ef174cbc5ed3e56e4de4986846f89a76ee')
options=(!lto)

build() {
  cmake -B build -S "${_pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
  cmake --build build -j "$(nproc)"
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim:set ts=2 sw=2 et:
