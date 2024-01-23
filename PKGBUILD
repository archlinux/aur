# Maintainer: taotieren <admin@taotieren.com>

pkgbase=un-lock-git
pkgname=un-lock-git
pkgver=1.4.7.r0.ge4bd8ff
pkgrel=1
pkgdesc="un-lock developed to retrieve encryptData(token) for Xiaomi devices for unlocking bootloader"
arch=(any)
url="https://github.com/offici5l/un-lock"
license=('Apache-2.0')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
_pydeps=(requests
#     pyshorteners
    urllib3
    pycryptodomex
    termcolor)
depends=(
    android-tools
    python
    "${_pydeps[@]/#/python-}")
makedepends=(git
#     python-{setuptools,build,installer,wheel}
    )
backup=()
options=()
install=${pkgname}.install
source=("${pkgname}::git+${url}.git"
    "${pkgname}.install")
sha256sums=('SKIP'
            '155ed2934db9f99cf14c7df7e72f8e1f0ff062d8e1708739f6a838179f96ace6')

pkgver() {
    cd "${srcdir}/${pkgname}/"
    git describe --long --tags | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
}

package() {
    cd "$pkgname"
    install -Dm0755 offici5l-un-lock.py "$pkgdir/usr/bin/offici5l-un-lock"
}

