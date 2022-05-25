# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=python-dhall
pkgver=0.1.13
pkgrel=1
pkgdesc="Python bindings for dhall, a functional configuration language"
arch=('x86_64' 'i686')
url="https://pypi.org/project/dhall"
license=('Apache' 'MIT')
depends=('python' 'openssl')
makedepends=('python-pip' 'cargo' 'maturin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/s-zeng/dhall-python/archive/v${pkgver}.tar.gz")
sha256sums=('a436957f9e84af39a9a0c1cf85decaa6fded63434ca4913e6564a2ea3941de2a')
b2sums=('b3b28e64dc89ed002ec23d6d71a0d3f3a8888f866504b9df726a644d81a02afafb8924ab85beb16ec09d623059c973f12f7d93dd1117e1943de4167d466f29c6')

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
