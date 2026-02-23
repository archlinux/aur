# Maintainer: asyync1024 <asyync1024 at proton dot me>

_reponame=bin-cpuflags-x86
pkgname=${_reponame}-git
pkgver=1.0.8.r0.g4c2a7c5
pkgrel=1
pkgdesc='A small CLI tool to detect CPU flags (instruction sets) of X86 binaries'
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/HanabishiRecca/${_reponame}"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'git')
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
    cd "${_reponame}"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

prepare() {
    cd "${_reponame}"
    cargo fetch --locked
}

build() {
    cd "${_reponame}"
    cargo build --frozen --release --target-dir "${srcdir}"
}

check() {
    cd "${_reponame}"
    cargo test --frozen
}

package() {
    install -Dm755 "release/${_reponame}" -t "${pkgdir}/usr/bin"
    cd "${_reponame}"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
