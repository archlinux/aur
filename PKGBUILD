# Maintainer: Agustin Borgna <hello[at]aborgna.com.ar>

pkgname=dcj
pkgver=20150611
pkgrel=2
pkgdesc="Google's Distributed Code Jam testing tool"
arch=('i686' 'x86_64')
url="https://code.google.com/codejam"
license=('unknown')
depends=('python2>=2.7.0' 'go')
makedepends=('tar')

source=('https://code.google.com/codejam/contest/static/dcj_linux.tar.bz'
        'dcj.sh')
sha256sums=('SKIP'
            '3432f95e1b0cbb47e6a36f56e23c9c31f307e60d04490123d89c9f8bd11daf65')
noextract=('dcj_linux.tar.bz')

prepare() {
    cd "$srcdir"
    mkdir -p "dcj"
    tar -xf "dcj_linux.tar.bz" -C "dcj"
}

pkgver() {
    cd "$srcdir"
    printf "%s" "$(date -d "$(stat -c %y "dcj/dcj.py")" +%Y%m%d)"
}

package() {
    cd "$srcdir"

    mkdir -p "${pkgdir}/opt"
    cp -r "dcj" "${pkgdir}/opt/dcj"
    chmod o+g -R "${pkgdir}/opt/dcj"
    chmod 777 "${pkgdir}/opt/dcj/libraries"

    install -Dm755 "dcj.sh" "${pkgdir}/usr/bin/dcj"
}
