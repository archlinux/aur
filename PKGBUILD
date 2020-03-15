# Maintainer: Christian Ehringfeld <c.ehringfeld@t-online.de>
# Contributor: Mark Coolen <mark.coolen@gmail.com>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Manolis Tzanidakis
pkgname=e2guardian
pkgver=5.3.4
pkgrel=1
pkgdesc="Fork of dansguardian, an open source web content filter. It filters the actual content of pages based on many methods including phrase matching, request header and URL filtering, etc. It does not purely filter based on a banned list of sites."
url="http://e2guardian.org"
arch=('i686' 'x86_64' 'armv6h' 'arm' 'armv7h')
license=('GPL2')
makedepends=('grep' 'gzip' 'zlib')
depends=('pcre' 'perl')
url="http://e2guardian.org"
optdepends=('squid' 'clamav' 'c-icap')
conflicts=('dansguardian' 'dansguardian-dev')
install=${pkgname}.install
source=(https://github.com/e2guardian/${pkgname}/archive/v${pkgver}.tar.gz
         e2guardian
        e2guardian.service)
sha1sums=('4b2aa428418b0bd8a4aa22a0e4d15dc82e910290'
          '4505b1e66cc1f64b06eacb277de24c453831f215'
          'a4179286aa0d0bf3bb71f5459075a02ceaf0d518')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./autogen.sh
  ./configure --prefix="/usr" --enable-pcre --enable-locallists --enable-sslmitm=yes \
	      --enable-icap --enable-commandline= --enable-email --enable-trickledm \
              --sysconfdir=/etc --localstatedir=/var --enable-email --enable-clamd \
              --sbindir=/usr/bin
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
etc/e2guardian/authplugins/proxy-basic.conf
etc/e2guardian/authplugins/ident.conf
etc/e2guardian/authplugins/ip.conf
etc/e2guardian/authplugins/port.conf
etc/e2guardian/lists/weightedphraselist 
etc/e2guardian/lists/contentregexplist
etc/e2guardian/lists/exceptionfileurllist
etc/e2guardian/lists/exceptionextensionlist
etc/e2guardian/lists/bannedextensionlist
etc/e2guardian/lists/exceptionmimetypelist
etc/e2guardian/lists/exceptionregexpurllist
etc/e2guardian/lists/authplugins/ipgroups
etc/e2guardian/lists/bannedregexpheaderlist
etc/e2guardian/lists/phraselists/rta/banned
etc/e2guardian/lists/phraselists/sport/weighted
etc/e2guardian/lists/phraselists/proxies/weighted
etc/e2guardian/lists/phraselists/safelabel/banned
etc/e2guardian/lists/phraselists/peer2peer/weighted
etc/e2guardian/lists/phraselists/drugadvocacy/weighted
etc/e2guardian/lists/phraselists/googlesearches/banned
etc/e2guardian/lists/phraselists/conspiracy/weighted
etc/e2guardian/lists/phraselists/secretsocieties/weighted
etc/e2guardian/lists/phraselists/idtheft/weighted
etc/e2guardian/lists/phraselists/illegaldrugs/banned
etc/e2guardian/lists/phraselists/illegaldrugs/weighted_portuguese
etc/e2guardian/lists/phraselists/illegaldrugs/weighted
etc/e2guardian/lists/phraselists/violence/weighted_portuguese
etc/e2guardian/lists/phraselists/violence/weighted
etc/e2guardian/lists/phraselists/domainsforsale/weighted
etc/e2guardian/lists/phraselists/music/weighted
etc/e2guardian/lists/phraselists/upstreamfilter/weighted
etc/e2guardian/lists/phraselists/games/weighted
etc/e2guardian/lists/phraselists/weapons/weighted_portuguese
etc/e2guardian/lists/phraselists/weapons/weighted
etc/e2guardian/lists/phraselists/legaldrugs/weighted
etc/e2guardian/lists/phraselists/gore/weighted_portuguese
etc/e2guardian/lists/phraselists/gore/weighted
etc/e2guardian/lists/phraselists/warezhacking/weighted
etc/e2guardian/lists/phraselists/pornography/weighted_chinese
etc/e2guardian/lists/phraselists/pornography/weighted_malay
etc/e2guardian/lists/phraselists/pornography/weighted_german
etc/e2guardian/lists/phraselists/pornography/weighted_dutch
etc/e2guardian/lists/phraselists/pornography/banned_portuguese
etc/e2guardian/lists/phraselists/pornography/weighted_french
etc/e2guardian/lists/phraselists/pornography/weighted_polish
etc/e2guardian/lists/phraselists/pornography/banned
etc/e2guardian/lists/phraselists/pornography/weighted_danish
etc/e2guardian/lists/phraselists/pornography/weighted_japanese
etc/e2guardian/lists/phraselists/pornography/weighted_portuguese
etc/e2guardian/lists/phraselists/pornography/weighted_russian
etc/e2guardian/lists/phraselists/pornography/weighted_italian
etc/e2guardian/lists/phraselists/pornography/weighted_swedish
etc/e2guardian/lists/phraselists/pornography/weighted
etc/e2guardian/lists/phraselists/pornography/weighted_norwegian
etc/e2guardian/lists/phraselists/pornography/weighted_spanish
etc/e2guardian/lists/phraselists/personals/weighted_portuguese
etc/e2guardian/lists/phraselists/personals/weighted
etc/e2guardian/lists/phraselists/nudism/weighted
etc/e2guardian/lists/phraselists/malware/weighted
etc/e2guardian/lists/phraselists/goodphrases/weighted_general_polish
etc/e2guardian/lists/phraselists/goodphrases/weighted_general_swedish
etc/e2guardian/lists/phraselists/goodphrases/exception_email
etc/e2guardian/lists/phraselists/goodphrases/exception
etc/e2guardian/lists/phraselists/goodphrases/weighted_general
etc/e2guardian/lists/phraselists/goodphrases/weighted_general_danish
etc/e2guardian/lists/phraselists/goodphrases/weighted_general_malay
etc/e2guardian/lists/phraselists/goodphrases/weighted_general_dutch
etc/e2guardian/lists/phraselists/goodphrases/weighted_general_portuguese
etc/e2guardian/lists/phraselists/goodphrases/weighted_news
etc/e2guardian/lists/phraselists/translation/weighted
etc/e2guardian/lists/phraselists/chat/weighted_italian
etc/e2guardian/lists/phraselists/chat/weighted
etc/e2guardian/lists/phraselists/news/weighted
etc/e2guardian/lists/phraselists/badwords/weighted_german
etc/e2guardian/lists/phraselists/badwords/weighted_dutch
etc/e2guardian/lists/phraselists/badwords/weighted_french
etc/e2guardian/lists/phraselists/badwords/weighted_portuguese
etc/e2guardian/lists/phraselists/badwords/weighted_spanish
etc/e2guardian/lists/phraselists/webmail/weighted
etc/e2guardian/lists/phraselists/travel/weighted
etc/e2guardian/lists/phraselists/gambling/banned_portuguese
etc/e2guardian/lists/phraselists/gambling/banned
etc/e2guardian/lists/phraselists/gambling/weighted_portuguese
etc/e2guardian/lists/phraselists/gambling/weighted
etc/e2guardian/lists/phraselists/forums/weighted
etc/e2guardian/lists/phraselists/intolerance/banned_portuguese
etc/e2guardian/lists/phraselists/intolerance/weighted_portuguese
etc/e2guardian/lists/phraselists/intolerance/weighted
etc/e2guardian/lists/logsitelist
etc/e2guardian/lists/logregexpurllist
etc/e2guardian/lists/greysitelist
etc/e2guardian/lists/filtergroupslist
etc/e2guardian/lists/exceptionfilesitelist
etc/e2guardian/lists/bannedmimetypelist
etc/e2guardian/lists/exceptionurllist
etc/e2guardian/lists/logurllist
etc/e2guardian/lists/exceptionphraselist
etc/e2guardian/lists/bannedurllist
etc/e2guardian/lists/headerregexplist
etc/e2guardian/lists/bannediplist
etc/e2guardian/lists/exceptionsitelist
etc/e2guardian/lists/bannedphraselist
etc/e2guardian/lists/exceptioniplist
etc/e2guardian/lists/bannedregexpurllist
etc/e2guardian/lists/bannedsitelist
etc/e2guardian/lists/urlregexplist
etc/e2guardian/lists/greyurllist)
