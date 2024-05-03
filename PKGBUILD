# Maintainer:Haoyang Liu <tttturtleruss@gmail.com> 

pkgname=hustmirror-cli-git
pkgver=1.1.3.r1.g7def2f1
pkgrel=1
epoch=
pkgdesc="The command line tool (hustmirror-cli) is a small tool that can help you quickly change sources to HUST mirror sources."
arch=('any')
license=('GPL')
url='https://github.com/hust-open-atom-club/hustmirror-cli'
groups=()
depends=('bash')
makedepends=('make' 'python3' 'git')
checkdepends=()
optdepends=()
provides=()
conflicts=(hustmirror-cli)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+${url}.git"
        "$pkgname.patch"
	"$pkgname-makefile.patch")
noextract=()
sha256sums=('SKIP'
            'a08dfc1246edcb721505d717dff36abdaa4aee0f1a74c02d4eece69f563cb5e8'
	    '04c5c54b8dbf4f43d58024aacbfb05e769b5745a6bd090c1d2dbea6ce9f80b5d')
validpgpkeys=()

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 -i "$srcdir/$pkgname.patch"
	patch -p1 -i "$srcdir/$pkgname-makefile.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
