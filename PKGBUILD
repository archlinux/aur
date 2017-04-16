# Maintainer: Agustin Borgna <hello[at]aborgna.com.ar>

pkgname=dcj
pkgver=20150611
pkgrel=1
pkgdesc="Google's Distributed Code Jam testing tool"
arch=('i686' 'x86_64')
url="https://code.google.com/codejam"
license=('unknown')
depends=('python2>=2.7.0' 'go')
makedepends=('tar')

source=('https://code.google.com/codejam/contest/static/dcj_linux.tar.bz'
        'dcj.sh')
sha256sums=('SKIP'
            '3a44e0d4897b7951ac62ae99cfd87d0ad3e61fbfa0e2beb4390789e6f4e38fe0')
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

    install -Dm755 "dcj.sh" "${pkgdir}/usr/bin/dcj"
}
