# Maintainer: Tony André Haugen (t0nyandre) <post@tonyand.re>

pkgname=scry-git
_gitname=scry
pkgver=129.2e988b7
pkgrel=1
pkgdesc="Scry is a code analysis server for Crystal."
arch=("x86_64")
url="https://github.com/crystal-lang-tools/$_gitname"
license=("MIT")
depends=("git" "crystal")
source=("git+https://github.com/crystal-lang-tools/$_gitname")
sha256sums=("SKIP")

pkgver() {
        cd $_gitname
        echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
        cd "$srcdir/$_gitname"
        crystal build -p --verbose --no-debug -o $_gitname src/$_gitname.cr
}

package() {
        cd "$srcdir/$_gitname"
        install -D -m 0755 ./$_gitname "${pkgdir}/usr/bin/$_gitname"
        install -D -m 0644 LICENSE "${pkgdir}/usr/share/licenses/$_gitname/LICENSE"
}
