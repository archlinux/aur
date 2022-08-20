# Maintainer: taotieren <admin@taotieren.com>

pkgname=kicad-allegro
pkgver=0.1.0
pkgrel=1
pkgdesc="Converter from Allegro to KiCad, and Allegro extract viewer "
arch=('any')
url="https://github.com/system76/kicad-allegro"
license=("unkown")
provides=(${pkgname})
conflicts=(${pkgname}-git)
#replaces=(${pkgname})
depends=('cargo')
makedepends=('git' 'rust')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname}::git+https://github.com/system76/kicad-allegro.git")
sha256sums=('SKIP')

build() {
# build crm
    cd "${srcdir}/${pkgname}/"
    cargo build --release
}

# check() {
#     cd "${srcdir}/${pkgname}/"
#     cargo test --release
# }

package() {
# install crm
    install -Dm0755 "${srcdir}/${pkgname}/target/release/${pkgname}" "${pkgdir}/usr/share/${pkgname}/${pkgname}"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/env bash
cd /usr/share/${pkgname}/
./${pkgname} "\$@"
EOF

}
