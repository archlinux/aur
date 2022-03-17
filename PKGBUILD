# Maintainer: Peter Varo <hello@petervaro.com>

pkgname=arduino-cli-git
pkgver=r690.2f07f94
pkgver() {
    cd "arduino-cli"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="Arduino command line interface"
arch=(
    'x86_64'
    'i686'
)
url="https://github.com/arduino/arduino-cli"
license=('GPL3')
groups=('arduino')
makedepends=(
    'go'
    'git'
)
source=("git://github.com/arduino/arduino-cli.git")
md5sums=('SKIP')
package() {
    gopath="$GOPATH"
    if [ -z "$gopath" ]
    then
        gopath="$HOME/go"
    fi;
    GOPATH="$gopath" GO111MODULE=on go install github.com/arduino/arduino-cli@latest
    install -Dm755 "$gopath/bin/arduino-cli" "$pkgdir/usr/bin/arduino-cli"
}
