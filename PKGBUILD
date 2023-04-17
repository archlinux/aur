# Maintainer: mhdna <mhdna@outlook.com>
# Contributor: Christian Ehringfeld <c.ehringfeld@t-online.de>
# Contributor: Mark Coolen <mark.coolen@gmail.com>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Manolis Tzanidakis
pkgname=e2guardian
pkgver=5.4.6r
pkgrel=2
pkgdesc="Fork of dansguardian, an open source web content filter. It filters the actual content of pages based on many methods including phrase matching, request header and URL filtering, etc. It does not purely filter based on a banned list of sites."
url="http://e2guardian.org"
arch=('i686' 'x86_64' 'armv6h' 'arm' 'armv7h')
license=('GPL2')
makedepends=('grep' 'gzip' 'zlib')
depends=('pcre' 'perl')
optdepends=('squid' 'clamav' 'c-icap')
conflicts=('dansguardian' 'dansguardian-dev')
install=${pkgname}.install
source=( $pkgname-$pkgver.tar.gz::https://github.com/e2guardian/${pkgname}/archive/v${pkgver}.tar.gz
        e2guardian
        e2guardian.service)
sha1sums=('3f3563c6ea702a374f5dd9908cf69bad0bbeab43'
          '4505b1e66cc1f64b06eacb277de24c453831f215'
          'a4179286aa0d0bf3bb71f5459075a02ceaf0d518')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./autogen.sh
  ./configure '--prefix=/usr' '--enable-clamd=yes' '--sysconfdir=/etc' '--localstatedir=/var' \
              '--enable-icap=yes' '--enable-commandline=yes' '--enable-email=yes' \
              '--mandir=${prefix}/share/man' '--infodir=${prefix}/share/info' '--enable-pcre=yes' \
              '--enable-sslmitm=yes' 'CPPFLAGS=-mno-sse2 -g -O2' '--sbindir=/usr/bin'
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  rm -r ${pkgdir}/var/run
  install -d ${pkgdir}/usr/bin
  install -D data/scripts/e2guardian ${pkgdir}/etc/logrotate.d/e2guardian
  install -D -m644 ${srcdir}/e2guardian.service ${pkgdir}/usr/lib/systemd/system/e2guardian.service
}

backup=(etc/e2guardian/e2guardian.conf
etc/e2guardian/e2guardianf1.conf
etc/e2guardian/downloadmanagers/default.conf
etc/e2guardian/authplugins/proxy-digest.conf
etc/e2guardian/authplugins/pf-basic.conf
etc/e2guardian/authplugins/port.conf
etc/e2guardian/authplugins/ident.conf
etc/e2guardian/authplugins/proxy-basic.conf
etc/e2guardian/authplugins/ip.conf
etc/e2guardian/lists/example.group/greysiteiplist
etc/e2guardian/lists/example.group/localbannedsearchlist
etc/e2guardian/lists/example.group/logurllist
etc/e2guardian/lists/example.group/localexceptionsitelist
etc/e2guardian/lists/example.group/greysslsitelist
etc/e2guardian/lists/example.group/domainsnobypass
etc/e2guardian/lists/example.group/logsitelist
etc/e2guardian/lists/example.group/refererexceptionsiteiplist
etc/e2guardian/lists/example.group/bannedsearchlist
etc/e2guardian/lists/example.group/exceptionurllist
etc/e2guardian/lists/example.group/bannedmimetypelist
etc/e2guardian/lists/example.group/greyurllist
etc/e2guardian/lists/example.group/oldweightedphraselist
etc/e2guardian/lists/example.group/localbannedsslsitelist
etc/e2guardian/lists/example.group/bannedextensionlist
etc/e2guardian/lists/example.group/localgreysiteiplist
etc/e2guardian/lists/example.group/localgreysslsitelist
etc/e2guardian/lists/example.group/bannedurllist
etc/e2guardian/lists/example.group/exceptionvirussiteiplist
etc/e2guardian/lists/example.group/greysitelist
etc/e2guardian/lists/example.group/bannedtimelist
etc/e2guardian/lists/example.group/ipnobypass
etc/e2guardian/lists/example.group/refererexceptionsitelist
etc/e2guardian/lists/example.group/localbannedurllist
etc/e2guardian/lists/example.group/bannedregexpurllist
etc/e2guardian/lists/example.group/localgreysitelist
etc/e2guardian/lists/example.group/sslsiteregexplist
etc/e2guardian/lists/example.group/localbannedsslsiteiplist
etc/e2guardian/lists/example.group/bannedsitelist
etc/e2guardian/lists/example.group/exceptionphraselist
etc/e2guardian/lists/example.group/bannedphraselist
etc/e2guardian/lists/example.group/bannedsiteiplist
etc/e2guardian/lists/example.group/oldbannedphraselist
etc/e2guardian/lists/example.group/exceptionsiteiplist
etc/e2guardian/lists/example.group/logregexpurllist
etc/e2guardian/lists/example.group/exceptionregexpheaderlist
etc/e2guardian/lists/example.group/weightedphraselist
etc/e2guardian/lists/example.group/bannedsslsiteiplist
etc/e2guardian/lists/example.group/urlredirectregexplist
etc/e2guardian/lists/example.group/localgreyurllist
etc/e2guardian/lists/example.group/urlregexplist
etc/e2guardian/lists/example.group/exceptionregexpurllist
etc/e2guardian/lists/example.group/blankettimelist
etc/e2guardian/lists/example.group/localexceptionsiteiplist
etc/e2guardian/lists/example.group/bannedregexpheaderlist
etc/e2guardian/lists/example.group/oldexceptionphraselist
etc/e2guardian/lists/example.group/localexceptionurllist
etc/e2guardian/lists/example.group/localgreysslsiteiplist
etc/e2guardian/lists/example.group/headerregexplist
etc/e2guardian/lists/example.group/greysslsiteiplist
etc/e2guardian/lists/example.group/bannedsearchoveridelist
etc/e2guardian/lists/example.group/localbannedsiteiplist
etc/e2guardian/lists/example.group/responseheaderregexplist
etc/e2guardian/lists/example.group/bannedsslsitelist
etc/e2guardian/lists/example.group/exceptionfileurllist
etc/e2guardian/lists/example.group/exceptionregexpuseragentlist
etc/e2guardian/lists/example.group/localbannedsitelist
etc/e2guardian/lists/example.group/logsiteiplist
etc/e2guardian/lists/example.group/exceptionfilesitelist
etc/e2guardian/lists/example.group/refererexceptionurllist
etc/e2guardian/lists/example.group/exceptionsitelist
etc/e2guardian/lists/example.group/bannedregexpuseragentlist
etc/e2guardian/lists/example.group/urlnobypass
etc/e2guardian/lists/example.group/nocheckcertsiteiplist
etc/e2guardian/lists/example.group/exceptionfilesiteiplist
etc/e2guardian/lists/example.group/contentregexplist
etc/e2guardian/lists/example.group/addheaderregexplist
etc/e2guardian/lists/example.group/exceptionmimetypelist
etc/e2guardian/lists/example.group/exceptionextensionlist
etc/e2guardian/lists/example.group/exceptionvirusextensionlist
etc/e2guardian/lists/example.group/nocheckcertsitelist
etc/e2guardian/lists/common/exceptioniplist
etc/e2guardian/lists/common/embededreferersiteiplist
etc/e2guardian/lists/common/browserregexplist
etc/e2guardian/lists/common/nologextensionlist
etc/e2guardian/lists/common/searchexceptionregexplist
etc/e2guardian/lists/common/authexceptioniplist
etc/e2guardian/lists/common/nologurllist
etc/e2guardian/lists/common/embededreferersitelist
etc/e2guardian/lists/common/bannedclientlist
etc/e2guardian/lists/common/nologsitelist
etc/e2guardian/lists/common/nomitmsiteiplist
etc/e2guardian/lists/common/nologsiteiplist
etc/e2guardian/lists/common/bannediplist
etc/e2guardian/lists/common/authexceptionsitelist
etc/e2guardian/lists/common/embededrefererurllist
etc/e2guardian/lists/common/exceptionclientlist
etc/e2guardian/lists/common/nomitmsitelist
etc/e2guardian/lists/common/nologregexpurllist
etc/e2guardian/lists/common/searchregexplist
etc/e2guardian/lists/common/authexceptionurllist
etc/e2guardian/lists/phraselists/spanish/pornography/weighted
etc/e2guardian/lists/phraselists/spanish/badwords/weighted
etc/e2guardian/lists/phraselists/dutch/pornography/weighted
etc/e2guardian/lists/phraselists/dutch/badwords/weighted
etc/e2guardian/lists/phraselists/dutch/goodphrases/weighted
etc/e2guardian/lists/phraselists/chinesebig5/pornography/weighted
etc/e2guardian/lists/phraselists/french/pornography/weighted
etc/e2guardian/lists/phraselists/french/badwords/weighted
etc/e2guardian/lists/phraselists/danish/pornography/weighted
etc/e2guardian/lists/phraselists/danish/goodphrases/weighted
etc/e2guardian/lists/phraselists/norwegian/pornography/weighted
etc/e2guardian/lists/phraselists/polish/pornography/weighted
etc/e2guardian/lists/phraselists/polish/goodphrases/weighted
etc/e2guardian/lists/phraselists/russian-1251/pornography/weighted
etc/e2guardian/lists/phraselists/chinesegb2312/pornography/weighted
etc/e2guardian/lists/phraselists/portuguese/pornography/weighted
etc/e2guardian/lists/phraselists/portuguese/illegaldrugs/weighted
etc/e2guardian/lists/phraselists/portuguese/gore/weighted
etc/e2guardian/lists/phraselists/portuguese/gambling/banned
etc/e2guardian/lists/phraselists/portuguese/gambling/weighted
etc/e2guardian/lists/phraselists/portuguese/violence/weighted
etc/e2guardian/lists/phraselists/portuguese/badwords/weighted
etc/e2guardian/lists/phraselists/portuguese/personals/banned
etc/e2guardian/lists/phraselists/portuguese/personals/weighted
etc/e2guardian/lists/phraselists/portuguese/intolerance/banned
etc/e2guardian/lists/phraselists/portuguese/intolerance/weighted
etc/e2guardian/lists/phraselists/portuguese/goodphrases/weighted
etc/e2guardian/lists/phraselists/portuguese/weapons/weighted
etc/e2guardian/lists/phraselists/ukenglish/pornography/banned
etc/e2guardian/lists/phraselists/ukenglish/pornography/weighted
etc/e2guardian/lists/phraselists/ukenglish/illegaldrugs/weighted
etc/e2guardian/lists/phraselists/ukenglish/gore/weighted
etc/e2guardian/lists/phraselists/ukenglish/gambling/banned
etc/e2guardian/lists/phraselists/ukenglish/gambling/weighted
etc/e2guardian/lists/phraselists/ukenglish/proxies/weighted
etc/e2guardian/lists/phraselists/ukenglish/violence/weighted
etc/e2guardian/lists/phraselists/ukenglish/badwords/banned
etc/e2guardian/lists/phraselists/ukenglish/badwords/weighted
etc/e2guardian/lists/phraselists/ukenglish/personals/weighted
etc/e2guardian/lists/phraselists/ukenglish/warezhacking/weighted
etc/e2guardian/lists/phraselists/ukenglish/nudism/weighted
etc/e2guardian/lists/phraselists/ukenglish/intolerance/weighted
etc/e2guardian/lists/phraselists/ukenglish/drugadvocacy/weighted
etc/e2guardian/lists/phraselists/ukenglish/goodphrases/exception_email
etc/e2guardian/lists/phraselists/ukenglish/goodphrases/weighted
etc/e2guardian/lists/phraselists/ukenglish/goodphrases/weighted_news
etc/e2guardian/lists/phraselists/ukenglish/weapons/weighted
etc/e2guardian/lists/phraselists/ukenglish/games/weighted
etc/e2guardian/lists/phraselists/ukenglish/chat/weighted
etc/e2guardian/lists/phraselists/malay/pornography/weighted
etc/e2guardian/lists/phraselists/malay/goodphrases/weighted
etc/e2guardian/lists/phraselists/russian-koi8-r/pornography/weighted
etc/e2guardian/lists/phraselists/swedish/pornography/weighted
etc/e2guardian/lists/phraselists/swedish/goodphrases/weighted
etc/e2guardian/lists/phraselists/german/pornography/weighted
etc/e2guardian/lists/phraselists/german/badwords/weighted
etc/e2guardian/lists/phraselists/japanese/pornography/weighted
etc/e2guardian/lists/phraselists/italian/pornography/weighted
etc/e2guardian/lists/phraselists/italian/badwords/weighted
etc/e2guardian/lists/phraselists/italian/chat/weighted
etc/e2guardian/lists/contentscanners/exceptionvirusmimetypelist
etc/e2guardian/lists/contentscanners/exceptionvirusurllist
etc/e2guardian/lists/contentscanners/exceptionvirusextensionlist
etc/e2guardian/lists/contentscanners/exceptionvirussitelist
etc/e2guardian/lists/authplugins/ipgroups
etc/e2guardian/lists/authplugins/portgroups
etc/e2guardian/lists/authplugins/filtergroupslist
etc/e2guardian/lists/rooms/default)
