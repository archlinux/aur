# Maintainer: Artem Bilokorenko <abilokorenko@gmail.com>
# Contributor: Artem Vladimirov <mypochtav@gmail.com>
pkgname="bisection"
pkgver="r2.cad6efa"
pkgrel="1"
pkgdesc="Algorithm for solving equations"
arch=("x86_64")
url="https://github.com/GVBilokorenko/bisection"
license=("MIT")
depends=("go")
makedepends=("git" "binutils")
source=("bisection::git://github.com/GVBilokorenko/bisection.git")
sha512sums=("SKIP")

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    echo "go run /usr/bin/main.go -l \"\$parameterL\" -u \"\$parameterU\" -a \"\$parameterA\" -c \"\$parameterC\"" >> "bisection.sh"
    install -Dm755 ./bisection.sh "$pkgdir/usr/bin/bisection"
    install -Dm755 ./main.go "$pkgdir/usr/bin/main.go"
    install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
}
