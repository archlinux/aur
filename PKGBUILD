# Maintainer: Audun-Marius Gangstø <audun@gangsto.org>
pkgname=123-bin
pkgver=3.0
pkgrel=2
epoch=
pkgdesc="Lotus 1-2-3 for Unix release 3.0"
arch=("i386" "i686" "x86_64")
url="https://github.com/taviso/123elf"
license=('unknown')
groups=()
depends=("lib32-ncurses")
makedepends=('unzip' 'cpio' 'gcc' 'binutils' 'wget')
checkdepends=()
optdepends=()
provides=('123')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+https://github.com/taviso/123elf.git"
"https://archive.org/download/123-unix/123UNIX1.IMG"
"https://archive.org/download/123-unix/123UNIX2.IMG"
"https://archive.org/download/123-unix/123UNIX3.IMG"
"https://archive.org/download/123-unix/123UNIX4.IMG"
"https://archive.org/download/123-unix/123UNIX5.IMG"
"123.sh"
)
noextract=(
'123UNIX1.IMG'
'123UNIX2.IMG'
'123UNIX3.IMG'
'123UNIX4.IMG'
'123UNIX5.IMG'
)
sha256sums=(
    'SKIP'
    '09996c4e8e33f83cacbde257ad4b04ca6b1432102b1d6eef28e64bdf5d6b7315'
    '4bdc6559105fbf9e2237b06a896b2ea34ecadef086bdc08b1ee2b4928ad51239'
    '336a30d68115b4f2a51c8aee4605b5f95d7bfd22e43c6a5779b9938563929f87'
    '5a2fdc33cde7056522aa47740460cd44873e4b8c3bb4d3891b06610e95dd4218'
    '444d28234594436334231aaa06431bee3323ce7e300ba8e7c62fe16c87c11681'
    '02774d899d22c3ea807b5065e6ade1285eb5da175588507a4f047e65bce409b5'
    )
validpgpkeys=()

prepare() {
    cp 123UNIX1.IMG 123UNIX2.IMG 123UNIX3.IMG 123UNIX4.IMG 123UNIX5.IMG "$pkgname"/
	cd "$pkgname"
    y | ./extract.sh
}

build() {
	cd "$pkgname"
    ./binutils.sh || true
	make
}

check() {
	cd "$pkgname"
	make -k check
}

package() {
	cd "$pkgname"
    mkdir -p "$pkgdir/usr/bin"
    install -D -m755 "123" "$pkgdir/usr/share/lotus/bin/123.bin"
    install -D -m755 "../123.sh" "$pkgdir/usr/bin/123"
    gzip -kf root/lotus/man/man1/123.1
    install -D -m644 root/lotus/man/man1/123.1.gz "$pkgdir/usr/share/man/man1/123.1.gz"
    install -d "$pkgdir/usr/share/lotus"
    cp -r "root/lotus/123.v10" "$pkgdir/usr/share/lotus/"
}
