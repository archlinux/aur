# Maintainer: taotieren <admin@taotieren.com>

pkgname=crm
pkgver=0.1.8
pkgrel=1
pkgdesc="crm 是一个在终端运行的镜像管理程序，能够对 Cargo 镜像源进行简单的添加、修改、删除操作，并能帮助您快速的切换不同的 Cargo 镜像源。"
arch=('any')
url="https://github.com/wtklbm/crm"
license=('MIT' 'Apache-2.0')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname}-git)
#replaces=(${pkgname})
depends=('cargo')
makedepends=('make' 'git' 'cmake' 'gcc' 'rust')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://ghproxy.com/https://github.com//wtklbm/crm/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1d9b99c57bdee44765bcb27d750ac9af2564124558bc18f414749ba097459768')
build() {
# build crm
    cd "${srcdir}/${pkgname}-${pkgver}/"
    cargo build --release
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    cargo test --release
}

package() {
# install crm
    install -Dm0755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/share/${pkgname}/${pkgname}"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/env bash
cd /usr/share/${pkgname}/
./${pkgname} "\$@"
EOF

}
