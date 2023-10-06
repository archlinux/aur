# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=jetporch
pkgver=0.0.1
pkgrel=2
pkgdesc="Jet is a general-purpose, community-driven IT automation platform for configuration, deployment, orchestration, patching, and arbitrary task execution workflows."
arch=('x86_64')
url="https://jetporch.com/"
provides=('jetporch')
license=('GPL3')
makedepends=('rust' 'git' 'gzip' 'tar' 'gcc' 'cargo' 'openssl' 'make' 'pkg-config')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jetporch/jetporch/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}-examples.tar.gz::https://github.com/jetporch/jetporch_examples/archive/main.tar.gz")
sha256sums=('863676e16ac5b1d5e59d1ffab855d5e4b87bde6a1b994c588f5c80151f4b0fe9'
            'e2f89c9dd3766b579e528b165143a7cb29b169a6e392a8093758acbfebc60ade')

build() {
	cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}"/"${pkgname}-${pkgver}"
  install -Dm755 target/release/jetp "${pkgdir}"/usr/bin/jetp
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  cp -R "${srcdir}"/jetporch_examples-main ${pkgdir}/usr/share/doc/${pkgname}/examples
}
