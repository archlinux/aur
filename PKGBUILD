# Maintainer: Joop Kiefte <joop@kiefte.net>
pkgname=ruby-textplay-git
pkgver=r87.88f7871
pkgrel=3
pkgdesc="Convert fountain screenplays to Final Draft and HTML format, and convert HTML to PDF."
arch=('any')
url="https://www.olivertaylor.net/"
license=('custom:textplay')
depends=('ruby')
makedepends=('git') 
optdepends=('ttf-courier-prime: To print screenplays in the expected font'
	    'python-weasyprint: To create a PDF version from the output if you don''t want to use PrinceXML'
            'princexml: The PDF package textplay was written for, commercial - free version creates watermark')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('ruby-textplay::git+https://github.com/olivertaylor/Textplay')
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
	install -Dm755 textplay "$pkgdir/usr/bin/textplay"
}
