# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Co-maintainer: Dan Beste <dan.ray.beste@gmail.com>

pkgname=dybuk-git
gitname=dybuk
pkgver=r37.ef12906
pkgrel=1
pkgdesc='Prettify the ugly Rustc messages'
arch=(
    'i686'
    'x86_64'
)
url='https://github.com/Ticki/dybuk'
license=('MIT')
makedepends=(
    'cargo'
    'git'
    'rust'
)
provides=("${gitname}")
conflicts=("${gitname}")
source=('git+https://github.com/Ticki/dybuk.git')
sha256sums=('SKIP')

pkgver() {
    cd "${gitname}"

    printf "r%s.%s"                     \
        "$(git rev-list --count HEAD)"  \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "${gitname}"

	cargo build --release
}

package() {
    cd "${gitname}"

    install -m 755 \
        -D target/release/dybuk "${pkgdir}/usr/bin/${gitname}"
    install -m 644 \
        -D LICENSE "${pkgdir}/usr/share/licenses/${gitname}/LICENSE"
}
