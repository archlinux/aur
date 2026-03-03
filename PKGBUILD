# Maintainer: Arghyadip Chakraborty <dev@arghyac.com>

pkgname=fahhh-git
_pkgname=fahhh
pkgver=0.1.0.r4.g84863c8
pkgrel=1
pkgdesc='A minimal, blazingly fast auditory disappointment for failed commands'
arch=('x86_64')
url='https://github.com/arghyadipchak/fahhh'
license=('MIT')
depends=('alsa-lib')
makedepends=('rust' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    local ver=$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml | head -1)
    local rev=$(git rev-list --count HEAD)
    local hash=$(git rev-parse --short HEAD)
    printf "%s.r%s.g%s" "${ver}" "${rev}" "${hash}"
}

build() {
    cd "${srcdir}/${_pkgname}"
    cargo build --release --locked
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
