# Maintainer: Elijah Gregg <lovetocode999 at tilde dot team>
pkgname=amfora-favicons-git
pkgver=1.8.0.r24.g3e291cf
pkgrel=1
pkgdesc="Terminal browser for the Gemini protocol, patched for favicon.txt support"
arch=("x86_64")
url="https://github.com/makeworld-the-better-one/amfora"
license=("GPL3")
makedepends=("go" "git")
provides=("amfora")
conflicts=("amfora")
source=("git+https://github.com/lovetocode999/amfora-favicons.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/amfora-favicons"

    _tag=$(git tag --sort=v:refname | tail -n1)
    printf '%s.r%s.g%s' "${_tag#v}" "$(git rev-list "$_tag"..HEAD --count)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/amfora-favicons"

    make
}

package() {
    cd "$srcdir/amfora-favicons"

    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/applications"
    make PREFIX="$pkgdir/usr" install
}
