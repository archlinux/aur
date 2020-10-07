# Maintainer: Luis Martinez
# Credit: desbma
pkgname=zoxide-git
_pkgname=zoxide
pkgver=v0.4.3.r17.geaf63bc
pkgrel=1
pkgdesc='A fast cd command that learns your habits'
arch=('x86_64')
url="https://github.com/ajeetdsouza/${_pkgname}"
license=('MIT')
makedepends=('rust' 'git')
provides=('zoxide')
conflicts=('zoxide' 'zoxide-bin')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver()  {
    cd "${pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname}"
    cargo build --release --locked
}

package() {
    cd "${pkgname}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${_pkgname}
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
