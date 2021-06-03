pkgname=banano-vanity
pkgver=1.0
pkgrel=4
pkgdesc="A vanity address generator for banano cryptocurrency"
arch=('x86_64')
source=("https://github.com/flammenderdrache/banano-vanity/archive/refs/tags/${pkgver}.zip")
url="https://github.com/flammenderdrache/banano-vanity"
sha512sums=('SKIP')
makedepends=(
   'rust'
   'cargo'
   'git'
   'ocl-icd'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo fetch --locked
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --locked
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo test --release --locked
}


package() {
    #cd "${srcdir}/${pkgname}-${pkgver}"
	cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

