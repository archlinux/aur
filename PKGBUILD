# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Maxerll Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: Ruben Kelevra <ruben@vfn-nrw.de>

pkgname='rt'
pkgver='4.4.4'
pkgrel='2'
pkgdesc='Request Tracker (RT): The leading open-source issue tracking system'
arch=('any')
url='https://bestpractical.com/request-tracker'
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
source=("https://download.bestpractical.com/pub/$pkgname/release/$pkgname-$pkgver.tar.gz"
        "rt.install")
sha512sums=('95335cfa9e7107300670a5e8631ffb6f402895dae051201d051ac01885b0cb185f838a666acaec773e0f670e1b9d16b7cede72f37ce9832fd83a9da8514e6972'
            '5ebb245ddccbdf277332e84f5b2c92966e682aea81d371cae8b96d257a9fd341e21a4f1f9ac49208a59f203c07b2c13964a99e544b54f40ff77228881907d9ed')
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
