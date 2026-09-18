# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=celq-bin
pkgver=0.7.1
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
sha256sums_x86_64=('88e237e8c550556fdbbf2c4ff6ebd1b05921924df2d611ec756b1ad0e5641db2')
sha256sums_aarch64=('8df641a435131f3a371597b99962e9f4df9258e2e7ace7f707ae9380ed0114d9')

latestver() {
    gh api --paginate repos/IvanIsCoding/celq/releases --jq '.[] | select(.prerelease == false and .draft == false and any(.assets[]; .name == "celq-linux-x86_64-gnu.tar.gz") and any(.assets[]; .name == "celq-linux-aarch64-gnu.tar.gz")) | .tag_name' |
    head -1 | sed 's/^v//'
}

package() {
    install -Dm755 celq "${pkgdir}/usr/bin/celq"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
