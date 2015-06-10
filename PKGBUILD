# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=git-rpg
pkgname=${_pkgname}-git
pkgver=20120907.r22.87b8dcf
pkgrel=1
arch=('any')
pkgdesc='A minimal role-playing game for git to grind out xp while you grind out bugfixes'
url="https://github.com/stevvvn/git-rpg"
license=('unknown')
depends=('ruby')
makedepends=('git')

source=("$_pkgname::git+${url}")
sha512sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "%s.r%s.%s" \
           "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" \
           "$(git rev-list --count HEAD)" \
           "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $_pkgname
    # Modify the README to reflect the fact that git-rpg is already installed via this package
    sed -i 's|^Installation$|Setup|;
            s|-----*|-----|;
            /^\* Make sure you have ruby installed\.$/,/^\* Run '"'make'"' as root to install the git-rpg executable\.$/d;s|^\* After that, in|\* In|' \
                README.md
}

package() {
    cd $_pkgname
    install -Dm644 README.md "$pkgdir"/usr/share/doc/${_pkgname}/README.md
    install -Dm755 bin/${_pkgname} "$pkgdir"/usr/bin/${_pkgname}
}
