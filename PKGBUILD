# Maintainer: goetzc

pkgname=interception-k2k-git
_realname=interception-k2k
pkgver=0.0.0.r30.259a549
pkgrel=1
pkgdesc="Configurable plugin for Interception Tools (caps2esc, space2meta, tab2altgr...)"
arch=(x86_64)
license=(MIT)
url="https://github.com/zsugabubus/interception-k2k"
depends=(interception-tools)
install=$_realname.install
source=("$pkgname::git+$url"
        "udevmon.yaml")

pkgver() {
    cd ${pkgname}
    printf "0.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/${pkgname}
    make
    make CONFIG_DIR=caps2esc
}

package() {
    cd ${srcdir}
    mkdir -p "${pkgdir}/usr/bin/"
    install -D -m0755 "${pkgname}/out/interception-pipe0" "${pkgdir}/usr/bin/"
    install -D -m0755 "${pkgname}/out/interception-pipe1" "${pkgdir}/usr/bin/"
    install -D -m0755 "${pkgname}/out/caps2esc" "${pkgdir}/usr/bin/${_realname}"
    install -D -m0644 udevmon.yaml "${pkgdir}/usr/share/doc/${_realname}/udevmon.example.yaml"
}

sha256sums=('SKIP'
            '1b00bff3180178ccaa59a6e29c2add6801864f1d092ea9cc5da0ebc1c270fa38')
