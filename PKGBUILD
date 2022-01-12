# Maintainer: Aphosis <aphosis.github@gmail.com>
pkgname=gmux
pkgver=0.1.5
pkgrel=1
pkgdesc="Manage multiple git repositories with ease."
url="https://github.com/Aphosis/gmux"
arch=("x86_64")
license=("MIT")
makedepends=("cargo")
provides=("gmux")
source=(https://github.com/Aphosis/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('4a4a6b8c295955f3d75a978d0b3411ede71ca415be0d85997505f459deb1adb08ded977a087edb74e48a7927adac2e2ac4af6c55f36a240475ba11eaf4ad2e85')
b2sums=('0bfa3076b5757fb0da8612399d61989041b2cde13612d5e028b18693da41a18961a5ec56110ee00a109973d4c2793490563e9e4cd8263c8b752be8ea25a5343c')

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
    -t "${pkgdir}/usr/share/fish/vendor_completions.d"

  install -Dm 644 \
    target/release/${pkgname}.bash \
    -T "${pkgdir}/usr/share/bash-completion/completions/gmux"

  install -Dm 644 \
    target/release/_${pkgname} \
    -T "${pkgdir}/usr/share/zsh/site-functions/_gmux"

  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

