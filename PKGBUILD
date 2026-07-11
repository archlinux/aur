# Maintainer: Stefan Wimmer <info@stefanwimmer128.xyz>

pkgname='zellij-selector'
pkgver='3.0.0'
pkgrel='1'
pkgdesc='Select zellij session'
arch=('any')
url='https://gitlab.com/stefanwimmer128/zellij-selector'
license=('MPL2')
depends=('sh' 'libnewt' 'zellij' 'jq.sh' 'yq')
makedepends=('shellcheck' 'getoptions-ng')
optdepends=('fish: Option to open fish shell'
            'zsh: Option to open zsh shell'
            'bash: Option to open bash shell')
source=("$url/-/releases/v$pkgver/downloads/zellij-selector-v$pkgver.tar.gz")
sha256sums=('b0b59d262d8a92555e8d8cc431c2b9fc7bf0df8cdb6ad018ac8f8daafdb282ce')

prepare() {
    cd "$pkgname-v$pkgver" || return
    ./configure --prefix=/usr
}

build() {
    cd "$pkgname-v$pkgver" || return
    make
}

check() {
    cd "$pkgname-v$pkgver" || return
    make check
}

package() {
    cd "$pkgname-v$pkgver" || return
    make DESTDIR="$pkgdir" install
}
