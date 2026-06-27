# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=kernelscript-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Modern, type-safe, domain-specific programming language for eBPF-centric kernel customization"
arch=('x86_64')
url="https://github.com/multikernel/kernelscript"
license=('Apache-2.0')
depends=('glibc' 'libbpf')
optdepends=(
    'clang: compile generated C to eBPF bytecode'
    'linux-headers: kernel headers for eBPF compilation'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x86_64")
sha256sums=('fc44f8e3638fb9e5d8db8c1f3f569e2f545c74837b6d1eae1c20e9e1f7f0e437')
options=('!debug')

latestver() {
    curl -fsSL "https://api.github.com/repos/multikernel/kernelscript/releases/latest" |
        jq -r '.tag_name // empty' | sed 's/^v//'
}

package() {
    install -Dm755 "${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/kernelscript"
}
