# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=python-dhall
pkgver=0.1.11
pkgrel=2
pkgdesc="Python bindings for dhall, a functional configuration language"
arch=('x86_64' 'i686')
url="https://pypi.org/project/dhall"
license=('Apache' 'MIT')
depends=('python' 'openssl')
makedepends=('python-pip' 'cargo' 'maturin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/s-zeng/dhall-python/archive/v${pkgver}.tar.gz")
sha256sums=('c5859b0e8fe6216dfb50dd0f5dc750404e3ef873e76859b7e32f893aecd613f6')
b2sums=('6b98c0fa1769a0067b29ba56459de8130fa5070171ee7b03f9f5322e10e460b66c18a816a16114bc8c7bb78d54de002b9926cc369ecfab92d86afbfb99942896')

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
