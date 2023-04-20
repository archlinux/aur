# Maintainer: Ashish Kushwaha <ashish.kus2408@gmail.com>
pkgname=batfetch
pkgver=r7.8f742df
pkgrel=1
pkgdesc="A  command-line tool that displays detailed information about the battery of your device in a clean and organized way."
arch=('x86_64')
url="https://github.com/ashish-kus/batfetch"
license=('GPL')
makedepends=('git')
provides=('batfetch')
conflicts=('batfetch')
source=(git+https://github.com/ashish-kus/batfetch)
md5sums=('SKIP')

pkgver() {
        cd "$pkgname"
        (
                set -o pipefail
                git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
                        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
        )
}

package() {
        cd "$pkgname"
        install -Dm755 ./src/batfetch "$pkgdir/usr/bin/$pkgname"
        install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
        install -Dm644 ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
