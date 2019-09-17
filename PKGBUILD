# Maintainer: Götz Christ <goetzchrist@gmail.com>
pkgname=interception-k2k-git
_realname=interception-k2k
pkgver=0.0.0.r6.0b3dfc1
pkgrel=1
pkgdesc="Unofficial plugin for Interception Tools (caps2esc, tab2altgr) - patched"
arch=(x86_64)
license=(MIT)
url="https://github.com/zsugabubus/interception-k2k"
depends=(interception-tools)
install=$_realname.install
source=("$pkgname::git+$url"
        "udevmon.yaml")
md5sums=(SKIP
         5fc5d48b4291bf808205f50c9142c188)

pkgver() {
    cd $pkgname
    printf "0.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${srcdir}/${pkgname}
    sed -e '/KEY_SPACE/ s|^\/*|// |' -i tap-rules.h.in
}

build() {
    cd ${srcdir}/${pkgname}
    make
}

package() {
    cd ${srcdir}
    install -D -m0755 ${pkgname}/$_realname "$pkgdir/usr/bin/${_realname}"
    install -D -m0644 udevmon.yaml "$pkgdir/usr/share/doc/${_realname}/udevmon.example.yaml"
}
