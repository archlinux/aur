pkgname=tuyapi-cli
_pkgname=cli
pkgver=v1.18.3.r0.g8e86743
pkgrel=1
pkgdesc="A CLI for Tuya devices."
arch=("x86_64")
url="https://github.com/TuyaAPI/cli"
license=('MIT')
makedepends=(npm git)
provides=(tuya-cli)
source=("${pkgname}::git+https://github.com/TuyaAPI/cli.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/${pkgname}
    npm install
}

package() {
    cd ${srcdir}/${pkgname}
    npm install -g --prefix "${pkgdir}/usr"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
