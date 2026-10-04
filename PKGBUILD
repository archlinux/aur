# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=output-as-format
pkgver=0.04
pkgrel=2
pkgdesc="Take stdin and format it as a GitHub/Slack/Jira-formatted code/quote block"
arch=('any')
url="https://github.com/sshaw/output-as-format"
license=('custom:none')
depends=('perl')
makedepends=('perl-extutils-makemaker')
_tag="v0.04"
_srcdir="output-as-format-0.04"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/sshaw/output-as-format/tar.gz/refs/tags/$_tag")
sha256sums=('67f396972b6ccd69820af4f51e1232673f282f078f19c5113c731d2f304ac38a')

build() {
	cd "$_srcdir"
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

package() {
	cd "$_srcdir"
	make DESTDIR="$pkgdir" install
	find "$pkgdir" -name ".packlist" -delete
	find "$pkgdir" -name "perllocal.pod" -delete
	install -Dm644 Changes "$pkgdir/usr/share/doc/$pkgname/Changes"
	install -Dm644 README.pod "$pkgdir/usr/share/doc/$pkgname/README.pod"
}
