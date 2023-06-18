# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=python-dhall
pkgver=0.1.15
pkgrel=1
pkgdesc="Python bindings for dhall, a functional configuration language"
arch=('x86_64' 'i686')
url="https://pypi.org/project/dhall"
license=('Apache' 'MIT')
depends=('python' 'openssl')
makedepends=('cargo' 'python-build' 'python-maturin' 'python-installer' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/s-zeng/dhall-python/archive/v${pkgver}.tar.gz")
sha256sums=('f2035d053a18cbcc943d614333cf2f719e225cd61555e6ec2c89f1c87480c923')
b2sums=('8bf32de73ed467e5d2916ebeeef8cd14cfe7b13351ed521ff96ae264b705669f84015cb96ba62f6532f44700ed24b4a884f6e4ce86b9c1342e4185626d621f8d')

build() {
  cd "dhall-python-${pkgver}"

  OPENSSL_NO_VENDOR=1 python -m build --wheel --no-isolation
}

package() {
  cd "dhall-python-${pkgver}"

  python -m installer --destdir="$pkgdir" target/wheels/dhall-$pkgver-*.whl

  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE-*
}

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}
