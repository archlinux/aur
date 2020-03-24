# Maintainer:  Yigit Dallilar <yigit.dallilar@gmail.com>
# Prev. Maintainer: orumin <dev at orum.in>

pkgname=slack-term
pkgver=0.5.0
pkgrel=1
pkgdesc="Slack client for your terminal"
arch=('x86_64')
url="https://github.com/erroneousboat/slack-term"
source=("slack-term-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "slack-term.json")
noextract=("slack-term-${pkgver}.tar.gz")
license=('MIT')
conflicts=('slack-term-bin')
options=()
makedepends=("go")
md5sums=('77c64a2aac37d65cbcfe2cecab043b9f'
         '9cdd35c2d48f6d899333ab3721a6464b')


build() {

    export GOPATH=$(pwd)
    reldir=src/github.com/erroneousboat

    mkdir -p ${srcdir}/${reldir}
    ln -s $(pwd)/slack-term-${pkgver}.tar.gz ${srcdir}/${reldir}       
    cd ${srcdir}/${reldir}
    tar zxvf slack-term-${pkgver}.tar.gz
    mv slack-term-${pkgver} slack-term
    cd slack-term
    make build-linux

}

package() {

    reldir=src/github.com/erroneousboat

    install -Dm755 ${srcdir}/${reldir}/slack-term/bin/slack-term-linux-amd64 ${pkgdir}/usr/bin/slack-term
    install -Dm644 ${srcdir}/${reldir}/slack-term/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 slack-term.json ${pkgdir}/etc/slack-term.json

}

# vim:set ts=4 sw=4 et:
