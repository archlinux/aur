# Maintainer: Manuel Barrio Linares <mbarriolinares at gmail dot com>
# Contributor: Boris Barbulovski <bbarbulovski@gmail.com>

pkgname='c3-lsp-git'
pkgver=0.4.0.r17.g0ba4f2a
pkgrel=1
pkgdesc='Language Server for the C3 language (git version).'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/pherrymason/c3-lsp'
license=('GPL-3.0-only')
makedepends=('make' 'go' 'git')
depends=('glibc')
conflicts=('c3-lsp')
provides=('c3-lsp')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/c3-lsp"
    git describe --tags --long | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    make build -C "$srcdir/c3-lsp"
}

package() {
    install -Dm755 "$srcdir/c3-lsp/server/bin/c3lsp" "$pkgdir/usr/bin/c3lsp"
    install -Dm644 "$srcdir/c3-lsp/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
