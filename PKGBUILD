# Maintainer: Vincent Herlemont <vincentherl@leszeros.com>
pkgname=short-git
pkgver=0.3.2.r1.g451352e
pkgrel=1
pkgdesc="A concise cli launcher / project manager using env files"
source=("${pkgname}::git+https://github.com/vincent-herlemont/short.git")
url="https://github.com/vincent-herlemont/short"
makedepends=('git' 'rust' 'cargo' 'openssl' 'libgit2')
provides=()
replaces=()
md5sums=('SKIP')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('Apache-2.0' 'MIT')

pkgver() {
    cd ${pkgname};
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${pkgname};
    cargo build --release --locked --features disabled_check_new_version
}

package() {
   cd ${pkgname};
   install -Dm 755 target/release/sht -t "${pkgdir}/usr/bin"
}
