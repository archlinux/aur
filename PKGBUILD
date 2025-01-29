# Maintainer:    Giteeajake <giteeajake@qq.com>
# Contributor:   AImixAE    <AImixAE@outlook.com>

pkgname=gcc-kawaii-plugin-zh
pkgver=0.4.0
pkgrel=1
pkgdesc='a gcc plugin and make your GCC	kawaii :)'
arch=('any')
url="https://ghproxy.cn/https://github.com/Bill-Haku/kawaii-gcc"
license=('GPL-3.0-or-later')
depends=('gcc' 'noto-fonts-cjk')
makedepends=('gettext' 'git')
optdepends=('wqy-zenhei: fonts support'
    'wqy-microhei: fonts support')
source=("${pkgname}::git+${url}")
install="${pkgname}.install"
sha256sums=(SKIP)

build() {
    cd ${srcdir}/${pkgname}
    make
}

check() {
    if [[ ! -f ${srcdir}/${pkgname}/build/zh-kawaii.mo ]]; then
        exit 1
    fi
}

package() {
    # clean no need
    rm -rf ${srcdir}${pkgname}/build/ja-kawaii.mo
    rm -rf ${srcdir}${pkgname}/build/zh-origin.mo

    install -Dm644 "$srcdir/$pkgname/build/zh-kawaii.mo" \
        "$pkgdir/usr/share/locale/zh_CN/LC_MESSAGES/gcc-kawaii.mo"
}
