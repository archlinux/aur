# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=python-dhall
pkgver=0.1.12
pkgrel=1
pkgdesc="Python bindings for dhall, a functional configuration language"
arch=('x86_64' 'i686')
url="https://pypi.org/project/dhall"
license=('Apache' 'MIT')
depends=('python' 'openssl')
makedepends=('python-pip' 'cargo' 'maturin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/s-zeng/dhall-python/archive/v${pkgver}.tar.gz")
sha256sums=('21b111c5b9f239a78868513632d283ea0df84da93e4446a0c5cde4f6d493589c')
b2sums=('8166254cb422c847386f3bb40484cf5af3f31000074eef4592caa03156899bf9c94fb9fd973922f52686ae592a8c9f586589cb402a2b9a0452aad871b5e101ce')

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
