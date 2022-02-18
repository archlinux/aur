# Maintainer: Elijah Gregg <lovetocode999 at tilde dot team>
pkgname=amfora-git
pkgver=1.9.2.r27.gea9c7f2
pkgrel=1
pkgdesc="Terminal browser for the Gemini protocol"
arch=("x86_64")
url="https://github.com/makeworld-the-better-one/amfora"
license=("GPL3")
makedepends=("go" "git")
provides=("amfora")
conflicts=("amfora")
source=("git+https://github.com/makeworld-the-better-one/amfora.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/amfora"

    _tag=$(git tag --sort=v:refname | tail -n1)
    printf '%s.r%s.g%s' "${_tag#v}" "$(git rev-list "$_tag"..HEAD --count)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/amfora"

    make
}

package() {
    cd "$srcdir/amfora"

    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/applications"
    make PREFIX="$pkgdir/usr" install
}
