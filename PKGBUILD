# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=celq-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Query and transform JSON, YAML, TOML, XML, and JSON5 data with CEL expressions"
arch=('x86_64' 'aarch64')
url="https://github.com/IvanIsCoding/celq"
license=('MIT' 'Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')

source=("${pkgname}-${pkgver}-LICENSE-MIT::https://raw.githubusercontent.com/IvanIsCoding/celq/v${pkgver}/LICENSE-MIT")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/IvanIsCoding/celq/releases/download/v${pkgver}/celq-linux-x86_64-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/IvanIsCoding/celq/releases/download/v${pkgver}/celq-linux-aarch64-gnu.tar.gz")
sha256sums=('c73e3f239b267fb3f998a0535e250920e1e520ec3b5b567894798f76f56b9bb9')
sha256sums_x86_64=('b7ebc80ab9e4a3307307396bc4458dbcb538ba5352abce84491740bbc1487712')
sha256sums_aarch64=('6521b51c8361f6abf34bef9e88f853ba9e2ced42e2487dfe43751ea54d22eb6f')

latestver() {
    gh api --paginate repos/IvanIsCoding/celq/releases --jq '.[] | select(.prerelease == false and .draft == false and any(.assets[]; .name == "celq-linux-x86_64-gnu.tar.gz") and any(.assets[]; .name == "celq-linux-aarch64-gnu.tar.gz")) | .tag_name' |
    head -1 | sed 's/^v//'
}

package() {
    install -Dm755 celq "${pkgdir}/usr/bin/celq"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
