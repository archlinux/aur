# Contributor: Maxerll Pray a.k.a. Synthead <synthead@gmail.com>
# Maintainer: Ruben Kelevra <ruben@vfn-nrw.de>

pkgname='rt'
pkgver='4.4.0'
pkgrel='1'
pkgdesc='Request Tracker (RT): The leading open-source issue tracking system'
arch=('any')
url='http://bestpractical.com/rt/'
license=('GPL')
depends=(
	'mysql'
	'perl-cgi-emulate-psgi'
	'perl-cgi-psgi'
	'perl-class-returnvalue'
	'perl-clone'
	'perl-convert-color'
	'perl-css-squish'
	'perl-data-ical'
	'perl-data-optlist'
	'perl-datetime'
	'perl-dbd-mysql'
	'perl-dbix-searchbuilder'
	'perl-devel-globaldestruction'
	'perl-email-address'
	'perl-fcgi'
	'perl-fcgi-procmanager'
	'perl-file-sharedir'
	'perl-gdgraph'
	'perl-gdtextutil'
	'perl-gnupg-interface'
	'perl-html-formattext'
	'perl-html-mason'
	'perl-html-mason-psgihandler'
	'perl-html-quoted'
	'perl-html-rewriteattributes'
	'perl-html-scrubber'
	'perl-html-tree'
	'perl-ipc-run3'
	'perl-json'
	'perl-locale-maketext-fuzzy'
	'perl-locale-maketext-lexicon'
	'perl-log-dispatch'
	'perl-mime-tools'
	'perl-mime-types'
	'perl-module-versions-report'
	'perl-net-cidr'
	'perl-net-snmp'
	'perl-package-stash'
	'perl-perlio-eol'
	'perl-regexp-common'
	'perl-regexp-common-net-cidr'
	'perl-regexp-ipv6'
	'perl-starlet'
	'perl-term-readkey'
	'perl-text-autoformat'
	'perl-text-password-pronounceable'
	'perl-text-quoted'
	'perl-text-template'
	'perl-text-wikiformat'
	'perl-text-wrapper'
	'perl-time-modules'
	'perl-tree-simple'
	'perl-universal-require'
	'perl-xml-rss'
	'perl>=5.8.3'
)
source=("http://download.bestpractical.com/pub/$pkgname/release/$pkgname-$pkgver.tar.gz"
        "rt.install")
sha512sums=('437518d53ea8b97abd563efeb63083642251ecfb1bac9737943ba5b8cc5c9497d2b378d6c141350f1bcff01f4dbca8678fa8393a3a4cec2e766dcd7f0372ba39'
            'SKIP')
backup=('opt/rt4/etc/RT_SiteConfig.pm')
install='rt.install'

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --with-web-user='http' --with-web-group='http'
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install

	mkdir -p "$pkgdir/opt/rt4/var/mason_data/obj"
	chown -R http:http "$pkgdir/opt/rt4/var/mason_data"
}
