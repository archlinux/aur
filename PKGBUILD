# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: yaroslav <proninyaroslav@mail.ru>

pkgname=infer
pkgver=1.0.0
pkgrel=1
pkgdesc="Static Analyzer by Facebook"
arch=('x86_64')
url="https://github.com/facebook/infer"
license=('BSD')
depends=('python2' 'python' 'java-environment' 'gcc>=5.0.0' 'opam>=2.0.0', 'ocaml>=4.11.1')
makedepends=('git' 'rsync')
source=("${pkgname}::git://github.com/facebook/infer.git")
sha256sums=('SKIP')


build() {
    cd "${pkgname}"
    ./build-infer.sh
}

package() {
    srcdir="${pkgname}"
    mkdir -p "${pkgdir}/usr/lib/${pkgname}" "${pkgdir}/usr/bin"
    cp -r "${srcdir}/${pkgname}" "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/facebook-clang-plugins/" "${pkgdir}/usr/lib/${pkgname}"
    cat > "${pkgdir}/usr/bin/infer" <<EOF
#!/bin/bash
/usr/lib/infer/infer/bin/infer "\$@"
EOF
    chmod +x "${pkgdir}/usr/bin/infer"
}
