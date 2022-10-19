# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=python-dhall
pkgver=0.1.14
pkgrel=1
pkgdesc="Python bindings for dhall, a functional configuration language"
arch=('x86_64' 'i686')
url="https://pypi.org/project/dhall"
license=('Apache' 'MIT')
depends=('python' 'openssl')
makedepends=('python-pip' 'cargo' 'maturin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/s-zeng/dhall-python/archive/v${pkgver}.tar.gz")
sha256sums=('d6b95f03d25c80a39267891b6401be6af411e5eac44591a1654267a96533c06c')
b2sums=('368857a5ef25d8fd0175ade30338a02fb0f91ffa5df340cc1b9ce7816f9724734a2e841ebe10c073d55c5d5136f3a62c67837a905f2c3656efbe26b36b71d9bf')

build() {
  cd "dhall-python-${pkgver}"

  maturin build --release --manylinux off
}

package() {
  cd "dhall-python-${pkgver}"

  PIP_CONFIG_FILE=/dev/null pip install \
    --isolated --root="${pkgdir}" --ignore-installed --no-deps \
    target/wheels/dhall-${pkgver}-*.whl

  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE-*
}

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}
