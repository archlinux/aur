# Maintainer: Aphosis <aphosis.github@gmail.com>
pkgname=gmux
pkgver=0.1.4
pkgrel=1
pkgdesc="Manage multiple git repositories with ease."
url="https://github.com/Aphosis/gmux"
arch=("x86_64")
license=("MIT")
makedepends=("cargo")
provides=("gmux")
source=(https://github.com/Aphosis/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('0009468dc95c28c8ec1d35af526a355663f872bb46e48c5dc93929ce952dcaab7641268c267168a7a9fe38a5718fa4dbd53323bb67c684c4c4c52e5a06836372')
b2sums=('2dd71a9f5fac3864d630ab36453d537e2c1a9f894666badccf9ebc5942b9c0b6ec60256cdfa2b0c955248d11a4bdba91a8cd76cf01dec3fde4bbc56fc9855adf')

build() {
  cd ${pkgname}-${pkgver}
  cargo build --release --locked
}

package() {
  cd ${pkgname}-${pkgver}

  install -Dm 755 \
    target/release/${pkgname} \
    -t "${pkgdir}/usr/bin"

  install -Dm 644 \
    target/release/${pkgname}.fish \
    -t "${pkgdir}/usr/local/share/fish/vendor_completions.d"

  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

