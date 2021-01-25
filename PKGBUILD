pkgname=short-git
pkgver=0.3.6.r0.g97fa26b
pkgrel=1
pkgdesc="Concise cli launcher / project manager using env files"
source=("${pkgname}::git+https://github.com/vincent-herlemont/short.git")
url="https://github.com/vincent-herlemont/short"
depends=('libgit2')
makedepends=('git' 'rust' 'cargo' 'openssl')
md5sums=('SKIP')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('APACHE' 'MIT')

pkgver() {
    cd ${pkgname};
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${pkgname};
    cargo build --release --locked --no-default-features
}

package() {
   cd ${pkgname};

   # sht binary:
   install -Dm 755 target/release/sht -t "${pkgdir}/usr/bin"

   # Licenses:
   install -d "${pkgdir}/usr/share/licenses/${pkgname}"
   install -m 644 LICENSE-MIT    \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

}