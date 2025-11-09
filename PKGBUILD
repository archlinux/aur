# Maintainer: Terrasse <terrasse@qq.com>
# Maintainer: ccmywish <ccmywish@qq.com>
pkgname=chsrc-git
pkgver=20251109.r1888.7e6c903
pkgrel=1
pkgdesc="A cli tool to change source for every software on every platform"
arch=('x86_64') # TODO: add more archs
url="https://github.com/RubyMetric/chsrc"
license=('GPL-3.0-or-later' 'MIT')
groups=()
depends=()
makedepends=('git')
provides=('chsrc')
conflicts=('chsrc')
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+$url")
noextract=()
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir"/"$pkgname"
    local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
    local count=$(git rev-list --count HEAD)
    local commit=$(git rev-parse --short HEAD)
    echo "$date.r${count}.$commit"
}

build() {
    cd "$srcdir"/"$pkgname"
	make
}

check() {
    cd "$srcdir"/"$pkgname"
    make fastcheck
}

package() {
    cd "$srcdir"/"$pkgname"
	install -Dm 755 chsrc -t $pkgdir/usr/bin/
	# MIT License
	install -Dm 644 LICENSE-MIT.txt -t $pkgdir/usr/share/licenses/$pkgname
    # Man Page
    install -Dm 644 doc/chsrc.1 -t $pkgdir/usr/share/man/man1/
    # Texinfo
    makeinfo doc/chsrc.texi --output=doc/chsrc.info
    install -Dm 644 doc/chsrc.info -t $pkgdir/usr/share/info/
}
