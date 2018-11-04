# Maintainer: Chris Hobbs (RX14) <chris@rx14.co.uk>

pkgname=nadeshiko
pkgver=2.3.3
pkgrel=1
pkgdesc="A Linux tool to cut short videos with ffmpeg"
arch=('any')
url="https://github.com/deterenkelt/$pkgname"
license=('GPL3')
depends=("wget" "bc" "xdg-utils" "xdg-user-dirs" "ffmpeg" "mediainfo" "perl-file-mimeinfo" "mkvtoolnix-cli")
optdepends=("libnotify: desktop notifications")
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/deterenkelt/$pkgname/archive/v$pkgver.tar.gz"
        "add-makefile.diff"
        "fix-bash-bug.diff")
sha256sums=('3474f723f93e9955e3870ddec5ca8e788727f86066040405426e77b9b98c7e5a'
            '0212e5bcb1563e13c6ad0635b160a6756b3443aef8a699efcf7b7d99900f2dc8'
            'eb20196289a97fae843dddd2c8842e58d30e8dd16042b520b858fcccfd380b3f')

prepare() {
    cd $srcdir/Nadeshiko-$pkgver

    patch -p1 < $srcdir/add-makefile.diff
    patch -p1 < $srcdir/fix-bash-bug.diff
}

package() {
    cd $srcdir/Nadeshiko-$pkgver
    make DESTDIR="$pkgdir" PREFIX=/usr
}
