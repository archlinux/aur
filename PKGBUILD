# $Id: PKGBUILD 161291 2012-06-08 23:30:06Z dreisner $
# Maintainer: Mark Coolen <mark.coolen@gmail.com>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Manolis Tzanidakis

pkgname=dansguardian
pkgver=2.10.1.1
pkgrel=13
pkgdesc="Extremely flexible web content filter."
url="http://dansguardian.org"
arch=('i686' 'x86_64' 'armv6h' 'arm')
license=('GPL2')
depends=('pcre' 'zlib')
optdepends=('squid')
conflicts=('dansguardian-dev')
install=${pkgname}.install
source=(http://dansguardian.org/downloads/2/Stable/${pkgname}-${pkgver}.tar.gz
        dansguardian
        dg2.10.1.1-missing.stdio.patch
        dansguardian.service)
md5sums=('0987a1c9bfbdf398118386f10279611a'
         '2ed21145aaee813564b0fc9599b764d7'
         '3444718c00cc17337cba711ceaa1c0e5'
         '819d7dcca75e99405fa5a9e5aa592b95')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -Np0 -i ${srcdir}/dg2.10.1.1-missing.stdio.patch
  ./configure --prefix="/usr" --with-proxyuser=nobody --with-proxygroup=nobody \
              --sysconfdir=/etc --localstatedir=/var --enable-email \
              --sbindir=/usr/bin
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  
  #fix the /usr/sbin binary install directory for arch's new '/usr/bin'-only guideline.
  install -d ${pkgdir}/usr/bin 

  install -D data/scripts/dansguardian ${pkgdir}/etc/logrotate.d/dansguardian
  
  install -D -m755 ${srcdir}/dansguardian ${pkgdir}/etc/rc.d/dansguardian
  install -D -m644 ${srcdir}/dansguardian.service ${pkgdir}/usr/lib/systemd/system/dansguardian.service
  rmdir "$pkgdir/var/run"
}

backup=(etc/dansguardian/dansguardian.conf 
etc/dansguardian/dansguardianf1.conf
etc/dansguardian/downloadmanagers/default.conf
etc/dansguardian/downloadmanagers/fancy.conf
etc/dansguardian/authplugins/proxy-digest.conf
etc/dansguardian/authplugins/proxy-basic.conf
etc/dansguardian/authplugins/ident.conf
etc/dansguardian/authplugins/ip.conf
etc/dansguardian/lists/weightedphraselist 
etc/dansguardian/lists/contentregexplist
etc/dansguardian/lists/exceptionfileurllist
etc/dansguardian/lists/exceptionextensionlist
etc/dansguardian/lists/bannedextensionlist
etc/dansguardian/lists/exceptionmimetypelist
etc/dansguardian/lists/blacklists/ads/urls
etc/dansguardian/lists/blacklists/ads/domains
etc/dansguardian/lists/exceptionregexpurllist
etc/dansguardian/lists/authplugins/ipgroups
etc/dansguardian/lists/bannedregexpheaderlist
etc/dansguardian/lists/phraselists/rta/banned
etc/dansguardian/lists/phraselists/sport/weighted
etc/dansguardian/lists/phraselists/proxies/weighted
etc/dansguardian/lists/phraselists/safelabel/banned
etc/dansguardian/lists/phraselists/peer2peer/weighted
etc/dansguardian/lists/phraselists/drugadvocacy/weighted
etc/dansguardian/lists/phraselists/googlesearches/banned
etc/dansguardian/lists/phraselists/conspiracy/weighted
etc/dansguardian/lists/phraselists/secretsocieties/weighted
etc/dansguardian/lists/phraselists/idtheft/weighted
etc/dansguardian/lists/phraselists/illegaldrugs/banned
etc/dansguardian/lists/phraselists/illegaldrugs/weighted_portuguese
etc/dansguardian/lists/phraselists/illegaldrugs/weighted
etc/dansguardian/lists/phraselists/violence/weighted_portuguese
etc/dansguardian/lists/phraselists/violence/weighted
etc/dansguardian/lists/phraselists/domainsforsale/weighted
etc/dansguardian/lists/phraselists/music/weighted
etc/dansguardian/lists/phraselists/upstreamfilter/weighted
etc/dansguardian/lists/phraselists/games/weighted
etc/dansguardian/lists/phraselists/weapons/weighted_portuguese
etc/dansguardian/lists/phraselists/weapons/weighted
etc/dansguardian/lists/phraselists/legaldrugs/weighted
etc/dansguardian/lists/phraselists/gore/weighted_portuguese
etc/dansguardian/lists/phraselists/gore/weighted
etc/dansguardian/lists/phraselists/warezhacking/weighted
etc/dansguardian/lists/phraselists/pornography/weighted_chinese
etc/dansguardian/lists/phraselists/pornography/weighted_malay
etc/dansguardian/lists/phraselists/pornography/weighted_german
etc/dansguardian/lists/phraselists/pornography/weighted_dutch
etc/dansguardian/lists/phraselists/pornography/banned_portuguese
etc/dansguardian/lists/phraselists/pornography/weighted_french
etc/dansguardian/lists/phraselists/pornography/weighted_polish
etc/dansguardian/lists/phraselists/pornography/banned
etc/dansguardian/lists/phraselists/pornography/weighted_danish
etc/dansguardian/lists/phraselists/pornography/weighted_japanese
etc/dansguardian/lists/phraselists/pornography/weighted_portuguese
etc/dansguardian/lists/phraselists/pornography/weighted_russian
etc/dansguardian/lists/phraselists/pornography/weighted_italian
etc/dansguardian/lists/phraselists/pornography/weighted_swedish
etc/dansguardian/lists/phraselists/pornography/weighted
etc/dansguardian/lists/phraselists/pornography/weighted_norwegian
etc/dansguardian/lists/phraselists/pornography/weighted_spanish
etc/dansguardian/lists/phraselists/personals/weighted_portuguese
etc/dansguardian/lists/phraselists/personals/weighted
etc/dansguardian/lists/phraselists/nudism/weighted
etc/dansguardian/lists/phraselists/malware/weighted
etc/dansguardian/lists/phraselists/goodphrases/weighted_general_polish
etc/dansguardian/lists/phraselists/goodphrases/weighted_general_swedish
etc/dansguardian/lists/phraselists/goodphrases/exception_email
etc/dansguardian/lists/phraselists/goodphrases/exception
etc/dansguardian/lists/phraselists/goodphrases/weighted_general
etc/dansguardian/lists/phraselists/goodphrases/weighted_general_danish
etc/dansguardian/lists/phraselists/goodphrases/weighted_general_malay
etc/dansguardian/lists/phraselists/goodphrases/weighted_general_dutch
etc/dansguardian/lists/phraselists/goodphrases/weighted_general_portuguese
etc/dansguardian/lists/phraselists/goodphrases/weighted_news
etc/dansguardian/lists/phraselists/translation/weighted
etc/dansguardian/lists/phraselists/chat/weighted_italian
etc/dansguardian/lists/phraselists/chat/weighted
etc/dansguardian/lists/phraselists/news/weighted
etc/dansguardian/lists/phraselists/badwords/weighted_german
etc/dansguardian/lists/phraselists/badwords/weighted_dutch
etc/dansguardian/lists/phraselists/badwords/weighted_french
etc/dansguardian/lists/phraselists/badwords/weighted_portuguese
etc/dansguardian/lists/phraselists/badwords/weighted_spanish
etc/dansguardian/lists/phraselists/webmail/weighted
etc/dansguardian/lists/phraselists/travel/weighted
etc/dansguardian/lists/phraselists/gambling/banned_portuguese
etc/dansguardian/lists/phraselists/gambling/banned
etc/dansguardian/lists/phraselists/gambling/weighted_portuguese
etc/dansguardian/lists/phraselists/gambling/weighted
etc/dansguardian/lists/phraselists/forums/weighted
etc/dansguardian/lists/phraselists/intolerance/banned_portuguese
etc/dansguardian/lists/phraselists/intolerance/weighted_portuguese
etc/dansguardian/lists/phraselists/intolerance/weighted
etc/dansguardian/lists/logsitelist
etc/dansguardian/lists/logregexpurllist
etc/dansguardian/lists/greysitelist
etc/dansguardian/lists/filtergroupslist
etc/dansguardian/lists/downloadmanagers/managedmimetypelist
etc/dansguardian/lists/downloadmanagers/managedextensionlist
etc/dansguardian/lists/exceptionfilesitelist
etc/dansguardian/lists/bannedmimetypelist
etc/dansguardian/lists/pics
etc/dansguardian/lists/exceptionurllist
etc/dansguardian/lists/logurllist
etc/dansguardian/lists/exceptionphraselist
etc/dansguardian/lists/bannedurllist
etc/dansguardian/lists/headerregexplist
etc/dansguardian/lists/bannediplist
etc/dansguardian/lists/exceptionsitelist
etc/dansguardian/lists/bannedphraselist
etc/dansguardian/lists/exceptioniplist
etc/dansguardian/lists/bannedregexpurllist
etc/dansguardian/lists/bannedsitelist
etc/dansguardian/lists/urlregexplist
etc/dansguardian/lists/greyurllist)

# vim: ts=2 sw=2 et ft=sh
