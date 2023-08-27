# Maintainer: Delta2Force <deltatwoforce@outlook.com>

pkgname=gk6x-git
pkgver=master
_pkgname=gk6x
pkgrel=1
pkgdesc="Configure keys, macros, and lighting on GK6X keyboards (GK64, GK84, GK61, etc)"
arch=('x86_64')
url="https://github.com/pixeltris/GK6X"
license=('MIT' 'unknown')
depends=('mono' 'bash') # need bash for gk6x script
makedepends=('mono-msbuild' 'git')
source=("git+https://github.com/pixeltris/GK6X.git" "gk6x")
md5sums=('SKIP' 'f0611a521786c9ca1fc5c075d7bd8aeb')
provides=('gk6x')
conflicts=('gk6x')

pkgver() {
    cd "$srcdir/GK6X"
    git describe --tags --long | sed 's/GK6X-v//g;s/-\(.\+\)-/.r\1./g'
}

build() {
    cd "$srcdir/GK6X"
    msbuild GK6X.sln
}

package() {
    mkdir -p "$pkgdir"/opt/gk6x "$pkgdir"/usr/bin
    cp -r "$srcdir"/GK6X/Build/* "$pkgdir"/opt/gk6x
    cp "$srcdir"/gk6x "$pkgdir"/opt/gk6x
    chmod 0755 "$pkgdir"/opt/gk6x/gk6x
    ln -sf /opt/gk6x/gk6x "$pkgdir"/usr/bin/gk6x
}
