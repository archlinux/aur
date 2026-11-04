# Maintainer: taotieren <admin@taotieren.com>

pkgname=ida-pro-plugin-zh-cn-git
pkgver=r4.85769b4
pkgrel=1
pkgdesc="IDA Pro 9.x Simplified Chinese Localization Plugin"
arch=(any)
url="https://github.com/chendiyao/IDA-Pro-zh-CN"
license=(CC-BY-4.0)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(
    ida-pro
    python
    pyside6
    shiboken6
)
makedepends=(
    git
)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

package() {
    cd "${srcdir}/${pkgname}"
    install -vDm0644 ida_zh_cn* -t "$pkgdir"/opt/ida-pro/plugins/
    install -vDm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
