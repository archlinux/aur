# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="horcrux-git"
pkgver=0.3.r16.g6575949
pkgrel=2
pkgdesc="Split your file into encrypted fragments so that you don't need to remember a passcode"
arch=("x86_64")
url="https://github.com/jesseduffield/horcrux"
license=("MIT")
provides=("horcrux")
conflicts=("horcrux-bin")
makedepends=("go")
optdepends=("horcrux-ui: graphical user interface")
source=("git+$url")
sha256sums=("SKIP")
options=("!strip")

pkgver(){
 cd "horcrux"
 git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build(){
 cd "horcrux"
 export CGO_CPPFLAGS="${CPPFLAGS}"
 export CGO_CFLAGS="${CFLAGS}"
 export CGO_CXXFLAGS="${CXXFLAGS}"
 export CGO_LDFLAGS="${LDFLAGS}"
 export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
 go build -o horcrux .
}

package(){
 cd "horcrux"
 install -D -m 755 "horcrux" "$pkgdir/usr/bin/horcrux"
 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/horcrux/LICENSE"
}
