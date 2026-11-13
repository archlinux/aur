# Maintainer: Deon Spengler <deon@spengler.co.za>
# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# Contributor: DJ Lucas <dj_AT_linuxfromscratch_DOT_org>
# Contributor: Steven Hiscocks <steven [at] hiscocks [dot] me [dot] uk>
# Contributor: Andre Wayand <aur-sogo@awayand.sleepmail.com>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=sogo
pkgver=5.12.13
pkgrel=1
pkgdesc="Groupware server with a web interface for mail, calendars and contacts, CalDAV, CardDAV and ActiveSync"
arch=(x86_64 aarch64)
url="https://github.com/Alinto/$pkgname"
# GPL-2.0-or-later for most of it, GPL-3.0-or-later for the cache classes of SoObjects/SOGo,
# LGPL-2.0-or-later for the SOPE extensions and parts of the mailer, LGPL-2.1-or-later for
# NSData+Crypto.m
license=(GPL-2.0-or-later GPL-3.0-or-later LGPL-2.0-or-later LGPL-2.1-or-later)
# What the programs, libraries and bundles link, and bash for the database update scripts
depends=(
  "sope>=$pkgver"
  bash
  curl
  glibc
  gnustep-base
  libgcc
  libmemcached-awesome
  libobjc
  libsodium
  libwbxml
  libxcrypt
  libytnef
  libzip
  oath-toolkit
  openssl
)
makedepends=(gcc-objc gnustep-make)
optdepends=('memcached: the cache SOGo needs, when it runs on the same host'
  'postgresql: database server, when it runs on the same host'
  'mariadb: database server, when it runs on the same host'
  'openldap: directory server, when it runs on the same host'
  'dovecot: IMAP and Sieve server, when it runs on the same host'
  'postfix: SMTP server, when it runs on the same host'
  'nginx: reverse proxy for the web interface'
  'apache: reverse proxy for the web interface, configured in /etc/httpd/conf/extra/SOGo.conf')
install=sogo.install
backup=(etc/sogo/sogo.conf
  etc/httpd/conf/extra/SOGo.conf
  etc/logrotate.d/sogo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/SOGo-$pkgver.tar.gz"
  sogo.service
  sogo.sysusers
  sogo.tmpfiles
  sogo-ealarms-notify.service
  sogo-ealarms-notify.timer
  sogo-expire-sessions.service
  sogo-expire-sessions.timer
  sogo-vacation-messages.service
  sogo-vacation-messages.timer
  openssl-4-asn1-string.patch
  html-injection-fail-closed.patch)
sha512sums=('63bbada039ec299c3de325ef818145968d0690fb8abb7b9456b2c7210787bc5ab98e0053b7fcf7985760c41877e2108374474161380aabe352601f935606c424'
  '6e50e094369cf7c17888ece338782ce58ad546f719f08d016a4f88e826aba47fcab48316dbeb92b6c4d30ae5123b108c6c7aed0085816c2746212032de14cf89'
  '2efa8480aa2ca9435499a1f214a0a0467fb7b9364492a3ff9f2113aa148a6c286a4cba90a4c1418a074e8351ea87bd52ef034dcec393ff812944196ef0548dcc'
  '541bb0d17b4302cd4198250fba3abef68116672d85a9ba7219660503094f4b54476d43c1e1fce0c3295269c7d7b9e25c366022ff1b72bdf8ff05e9cfc8d541ba'
  'd7054569afc410a0b84ece67ed65b1a23bfeedfbf1dfb757361de67f2d8e2e4c540cd832eb43864cdb69bf21cb6c8e03b2d93842d281cef64e7c60f09ad782b9'
  '7b7ddfd9d35974750b40dd3e18f35364231304bc3b7b6b048b3ff214afce9b7a025a48a61e0ad29fc6d3c107f08c6c49e0b37df3e824b25f8ad04229f99bf17e'
  '558c3bd083566eb78921b017091813af15f4cc7e7e8fa417ad05b7a56020fefbc73f2b172f9dbe350b9df0da017963d38adbdab0556620c33441511aae67d5c3'
  '8f7e0f81c933f932c30e5e1d5cb3c1a3f6ab7fddbcf623429ca97cb82355b3e5dc5925847183b70a8d1462a11c6c86bef863ece2ae3b419292676caf8792642c'
  '374a629eb0eb6c9d4d44930365c0c45f347ffd2475ef3ad8fd3377491b4b5567a3aade0d38213420435d7ad23236b491dea4c25265b27afaa833aced3efeb6a7'
  'd32e1bdfaa7f81e56227ac60a52adea36ec9f51c2057597c931562333b3fcae16d3e2ae09eaf6e02ffd103319ca163726d233f3e5bf1db0b260bfe5d8d15f6f6'
  '16a6a965254f424247398d67b172addf05dcc82e746291c0deb13d58436584c8c4f5732a6b1d9972d145f5de7ed8ccc50a7bda4bdf3e76c1c0015e18bdba43a0'
  'ed2af2acf39bb667eb7bca5514613f5fa185c5c78d83cbc2396f71348479fcf1a4a657aee609acf2481866c30c36416a7e18e5a24ea9dee03c19737975d70b3f')
b2sums=('40bfcc7e809008e789fcd03518da98177e9052a4697fe632e50e475993e7bd5753474dda9285da34ab20a3267bcdffe485d9833f6c2dcfe89d54400766367c3a'
  'ee8784f7a73eb256e956e90e5cc59eda03a64ff2cbed1da2da1761f48415b8e8a6c1b17b107601990e147f8312332ff664b9938f7ced84dcc325eb0547f1536a'
  '3c5781248e82ed9f616a65543b78bed19c6a65fc4c7488d3697f45b5d89a7d470b676a8a3f0966b879ae3c60cd92e3f186320d17dd26cf3e24c80dfb7e630e6e'
  '79671040a2756bf8ddc20772274da00d5bba75368132285e687b96ca8a3e8e2d4badba17d90a2aeacc00135df76062bbbf6c86af01905ba284c06f8c8fcac87b'
  '2e7bea6855cbe45c47f0cdccfa35786bf52f735030bf07c1c76d22b05fde5f13514f8e5cc4f0429e157df4e44e3896183a09599a691bcf64e89549612ca1cd39'
  'ec061e0618adcc9c5de17f65a2c4f1281aa37c3bf235a97d585854f0cba0f3b18c72011b32d1bd089a7b0347071e52761c833333d10f25c4dfd7ab244036ffc9'
  '829e7d19c64682f31ccd12cd7218769a5290f7c8eed757f4a9a36e97d54853237ba880820a01283684040b4ee4991a03e46cc0b09936719529353ac07b32ddd6'
  '1b8a01422b85a503a297ebbd1de514f4bcea87f77faf53a548172aea5400b7c7b240e7e6ac79aee0311a130391fe1389fee4745dee1d311f8ec47646a8b41db2'
  '98aa83c7b68272d6aaa9e5d9b13f71469207a61aa23f07cb0b88d1a60cda08c59288b6abcf97fbd3f6173cd5b360b917b1af00efa7b56e22e08c12ae305c78f4'
  '707de55b61b5185c778ad180ee6887d4a9bd6061941914dab3aa42b7a58a020bc38943dc46eb2e2a08951e7cd115519e1fca2a21a02eeca9372cca60263030d6'
  '7fbd0ea0d71e16be4c2ba4d487381fa34e58c4248791debf2990413a29743a0a48d7f63eef294ab2e7178a2aaf1cf9394981a90969162139dc0eac2cb74979a9'
  'f41b7f9c1c7931e919ac794e0a28b2ce5947eb60838cc8e0c7154388ae402b7d71583552078f8086e5dc80679833f3eba8c2d08392efe21c88f435c954e668f5')

prepare() {
  cd "$pkgname-SOGo-$pkgver" || exit
  # OpenSSL 4 makes ASN1_STRING opaque, the S/MIME code read its fields directly
  # Upstream fix: https://github.com/Alinto/sogo/pull/430
  patch -Np1 -i "$srcdir/openssl-4-asn1-string.patch"

  # The HTML injection filter returned a partially filtered string when one of its steps raised.
  # With GNUstep, that happens whenever a step removes all that's left: its
  # -stringByReplacingMatchesInString:... returns nil for an empty result (fixed in GNUstep, not
  # released yet: https://github.com/gnustep/libs-base/issues/800), so "javajavascript:script:"
  # came out as "javascript:". It returns an empty string instead now.
  # Upstream fix: https://github.com/Alinto/sogo/pull/431
  patch -Np1 -i "$srcdir/html-injection-fail-closed.patch"

  # Left out of the unit tests (renamed, so the runner doesn't take it for a test): the expected
  # address headers predate SOPE's change to encode display names (RFC 2047) and quote them in 2015
  # (Alinto/sope@67c9c4ff6), so all addresses with a name fail; upstream runs the tests in no CI.
  # Upstream fix: https://github.com/Alinto/sogo/pull/432
  sed -i 's/(void) test_generateDataForHeaderFieldNamed_value_/(void) disabled_generateDataForHeaderFieldNamed_value_/' \
    Tests/Unit/TestNGMimeAddressHeaderFieldGenerator.m
}

build() {
  cd "$pkgname-SOGo-$pkgver" || exit
  # Not autoconf, but a script of its own, which takes the paths and flags from gnustep-make.
  # - SSL with OpenSSL, as SOPE
  # - multi-factor authentication with TOTP (liboath); libsodium for the Argon2 password schemes is
  #   on by default
  # - without SAML2 for now: its liblasso (lasso, AUR) doesn't build with xmlsec 1.3.13, which declares
  #   xmlSecCryptoDLLoadLibrary in xmlsec/dl.h, a header lasso 2.9.0 doesn't include
  # - not a debug build, which the script makes by default: debug=yes means -O0 (general.make) and
  #   -DDEBUG for extra log output (gnustep-make), not debug symbols, which general.make always adds
  # - not stripped, as makepkg strips and splits off the debug symbols
  ./configure --disable-strip --disable-debug --with-ssl=ssl --enable-mfa
  make
  # ActiveSync is a bundle of its own, outside the main build (as in upstream's Debian package)
  make -C ActiveSync
}

check() {
  cd "$pkgname-SOGo-$pkgver" || exit
  # The unit tests run on SOGo's own libraries from the build, which aren't installed yet
  local _libs=("$PWD"/SOPE/{GDLContentStore,NGCards}/obj "$PWD"/SoObjects/SOGo/SOGo.framework/Versions/5/sogo)
  local IFS=:
  LD_LIBRARY_PATH="${_libs[*]}" make -C Tests/Unit check
}

package() {
  cd "$pkgname-SOGo-$pkgver" || exit
  make install DESTDIR="$pkgdir" GNUSTEP_INSTALLATION_DOMAIN=SYSTEM
  make -C ActiveSync install DESTDIR="$pkgdir" GNUSTEP_INSTALLATION_DOMAIN=SYSTEM

  # The configuration, upstream's example with the settings commented out, readable by sogo (see
  # sogo.tmpfiles); Apache's configuration for the web interface; the rotation of log files, should
  # WOLogFile name one
  install -Dm 640 Scripts/sogo.conf "$pkgdir/etc/sogo/sogo.conf"
  install -Dm 644 Apache/SOGo.conf "$pkgdir/etc/httpd/conf/extra/SOGo.conf"
  install -Dm 644 Scripts/logrotate "$pkgdir/etc/logrotate.d/sogo"

  # The scripts that update the database schema between versions, and the backup script
  install -Dm 755 -t "$pkgdir/usr/lib/sogo/scripts" Scripts/sql-*.sh Scripts/sogo-backup.sh
  install -Dm 644 -t "$pkgdir/usr/lib/sogo/scripts" Scripts/mysql-utf8mb4.sql

  # The user, the folders, the service and the timers of the periodic tasks (upstream's sogo.cron)
  install -Dm 644 "$srcdir/sogo.sysusers" "$pkgdir/usr/lib/sysusers.d/sogo.conf"
  install -Dm 644 "$srcdir/sogo.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/sogo.conf"
  install -Dm 644 -t "$pkgdir/usr/lib/systemd/system" "$srcdir"/sogo{,-ealarms-notify,-expire-sessions,-vacation-messages}.service \
    "$srcdir"/sogo-{ealarms-notify,expire-sessions,vacation-messages}.timer

  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md CHANGELOG.md
}
