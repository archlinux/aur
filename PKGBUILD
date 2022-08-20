# Maintainer: taotieren <admin@taotieren.com>

pkgname=kicad-allegro-git
pkgver=4968f13
pkgrel=1
pkgdesc="Converter from Allegro to KiCad, and Allegro extract viewer "
arch=('any')
url="https://github.com/system76/kicad-allegro"
license=("unkown")
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname%-git})
#replaces=(${pkgname})
depends=('cargo')
makedepends=('git' 'rust')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname%-git}::git+https://github.com/system76/kicad-allegro.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}/"
#     git describe --long --tags | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
    git describe --always --tags | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
# build crm
    cd "${srcdir}/${pkgname%-git}/"
    cargo build --release
}

# check() {
#     cd "${srcdir}/${pkgname%-git}/"
#     cargo test --release
# }

package() {
# install crm
    install -Dm0755 "${srcdir}/${pkgname%-git}/target/release/${pkgname%-git}" "${pkgdir}/usr/share/${pkgname%-git}/${pkgname%-git}"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-git}" << EOF
#!/bin/env bash
cd /usr/share/${pkgname%-git}/
./${pkgname%-git} "\$@"
EOF

}
