# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="horcrux-ui-git"
pkgver=0.1.r12.gd35f41a
pkgrel=1
pkgdesc="GUI for horcrux"
arch=("x86_64")
url="https://github.com/jesseduffield/horcrux-ui"
license=("MIT")
provides=("horcrux-ui")
depends=("horcrux")
makedepends=("go")
source=("git+$url"
        "horcrux.desktop"
        "horcrux.png")
sha256sums=('SKIP'
            'c451a7bf1a01a6f1fa120334f058aaf3b45109e9f7ad60175c13785eb39e186f'
            'fba920923cb8e5a778723ba5b3b4615ccfaef7cd1f49fa080da44e2aff3c7b91')
options=("!strip")

pkgver(){
 cd "horcrux-ui"
 git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build(){
 cd "horcrux-ui"
 export CGO_CPPFLAGS="${CPPFLAGS}"
 export CGO_CFLAGS="${CFLAGS}"
 export CGO_CXXFLAGS="${CXXFLAGS}"
 export CGO_LDFLAGS="${LDFLAGS}"
 export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
 go build -o horcrux-ui .
}

package(){
 cd "horcrux-ui"
 install -D -m 755 "horcrux-ui" "$pkgdir/usr/bin/horcrux-ui"
 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/horcrux-ui/LICENSE"
 install -D -m 644 "$srcdir/horcrux.png" "$pkgdir/usr/share/pixmaps/horcrux.png"
 install -D -m 644 "$srcdir/horcrux.desktop" "$pkgdir/usr/share/applications/horcrux.desktop" 
}
