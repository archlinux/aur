# Maintainer: Oscar Morante <oscar@morante.eu>
# Contributor: tobias [tobias [at] archlinux.org]
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=mutt-patched
pkgver=1.5.24
pkgrel=4
pkgdesc='Small but very powerful text-based mail client (plus a huge pile of patches mostly from debian)'
url='http://www.mutt.org/'
license=('GPL')
backup=('etc/Muttrc')
arch=('i686' 'x86_64')
optdepends=('smtp-forwarder: to send mail')
depends=('gpgme' 'ncurses' 'gnutls' 'libsasl' 'libidn' 'mime-types'
         'krb5' 'tokyocabinet')
makedepends=( 'w3m' 'docbook-xsl' )
conflicts=('mutt')
provides=('mutt')
source=(
  "https://bitbucket.org/mutt/mutt/downloads/mutt-${pkgver}.tar.gz"
  'am-maintainer-mode.patch'
  'ifdef.patch'
  'trash-folder.patch'
  'purge-message.patch'
  'imap_fast_trash.patch'
  'sensible_browser_position.patch'
  'patch-1.5.4.vk.pgp_verbose_mime.patch'
  'compressed-folders.patch'
  'compressed-folders.debian.patch'
  'Muttrc.patch'
  'Md.etc_mailname_gethostbyname.patch'
  'use_usr_bin_editor.patch'
  'correct_docdir_in_man_page.patch'
  'dont_document_not_present_features.patch'
  'document_debian_defaults.patch'
  'assumed_charset-compat.patch'
  '467432-write_bcc.patch'
  '566076-build_doc_adjustments.patch'
  'define-pgp_getkeys_command.patch'
  'gpg.rc-paths.patch'
  'smime.rc.patch'
  'fix-configure-test-operator.patch'
  '531430-imapuser.patch'
  '543467-thread-segfault.patch'
  '548577-gpgme-1.2.patch'
  '553321-ansi-escape-segfault.patch'
  '528233-readonly-open.patch'
  '228671-pipe-mime.patch'
  '383769-score-match.patch'
  '603288-split-fetches.patch'
  '611410-no-implicit_autoview-for-text-html.patch'
  'path_max.patch'
  'sidebar.patch'
  'sidebar-dotpathsep.patch'
  'sidebar-utf8.patch'
  'multiple-fcc.patch'
  'sidebar-newonly.patch'
  'sidebar-delimnullwide.patch'
  'sidebar-compose.patch'
  'sidebar-new.patch'
  'nntp.patch'
  'ats.date_conditional.patch'
)
sha1sums=('38a2da5eb01ff83a90a2caee28fa2e95dbfe6898'
          '1ad77bdf742ff584b5695f1908dde83044195c0e'
          '92fe7a726545424db6fc0f8b0612eeeeabb0fef4'
          'cce6c3484941a461c0852fccc6da4c89cfabd3d3'
          '2bf687eb20801706f85b8f88c87eb259f5c65d63'
          '9ac8aa4d41fd40c8a8866232826b1076a6a4d950'
          'e3e7b9c5b17be4032e111edb6a6999a3185c8f7b'
          '84b7d5debe1dba52f31114860fab680cea538302'
          '0270af48a6b67124564ebe8809dcb82a67fbf391'
          '6a53e85ee55c14beda0000de89a397f589cb29a7'
          'b841ad389301d336ba533356d057ea1f09bc150b'
          '8dc84a70076dc85fa496ebc2d6cd1e04acb35973'
          '1eac8b05b6793921e253412fc4ceb33f2898dd4a'
          'f72c27cc10d4c585591f5437b4d92437a92682bb'
          '12c74c647238e653c4db5f8eb7590c5723635b9c'
          'f8c2d3cc93b11074d95f5a2809bb9f022432884f'
          '464ca1c57f8a25177a586cb79b94398f694b32e3'
          '3e6846095d48d12453474919c5a2e1ce56294107'
          '2006013bbba89e5b95659347aa14938732c5312d'
          'a2baa71018743fb63704ea911931490668d62c0b'
          '42ab3017961819669c678e7456657ca677c8eb56'
          '8b54cc0190e62c138e4ff6769310661006a49e2f'
          '81d33556b66c721f2f25cd1f5485536999a7cb72'
          'f1ee08450995fe21e0dc3807563e7120d2e3d04a'
          'f2b98a258d5ee18f731aab975f5b0dd17945f228'
          'a247d69731c0df74a7e0f19d9206c3abeacb160a'
          '6ec4a7614dc78d230a9ebe8ec645393a98be41a4'
          '03a42b8914c9ef1f684275cba355046de14b1c03'
          '1b53316b0c09333dbee428448a6f565378ff5357'
          '8121dd0a07f6f98377e1b1ad3659deaec3a83b6b'
          'd4803ee5f29e9e495e12bf012dc938d7cd4adc47'
          '7a7cefe2433bd5bb4bb678be029b6d12f14fa1e6'
          'f91499aa8bee5827924e6c860bd853e0344d55bc'
          '604784b914e4c03743a62b33745a16037df090f3'
          '2fdfd1dcb9b45068c1c890d30e3dcc3a83a401a3'
          'c01c8f84e3ea4ac71caf31edeb6adb062eb04fe0'
          '71915a816d1995bdb11d021c9eac09ee28efda97'
          '0a9eb71f95f109a44688d4930dfb6eccf74cf682'
          '19fd36f9a1f15d4481f08d90f9a88d3912e12cdb'
          'ba0a5082ef9da710644f4bd71d08b25ccfb7fb8a'
          'ffc14992c112e262d994929102369df2be729ea9'
          'f0f0278d0b369d7d42c338f0c751e46fa5ec915a'
          '8ccb2a97bbe13936be10577c8526893309666f1a'
)
install=install

prepare() {
  cd "${srcdir}/mutt-$pkgver"

  patch -Np1 -i "${srcdir}/am-maintainer-mode.patch"
  patch -Np1 -i "${srcdir}/ifdef.patch"
  patch -Np1 -i "${srcdir}/trash-folder.patch"
  patch -Np1 -i "${srcdir}/purge-message.patch"
  patch -Np1 -i "${srcdir}/imap_fast_trash.patch"
  patch -Np1 -i "${srcdir}/sensible_browser_position.patch"
  patch -Np1 -i "${srcdir}/patch-1.5.4.vk.pgp_verbose_mime.patch"
  patch -Np1 -i "${srcdir}/compressed-folders.patch"
  patch -Np1 -i "${srcdir}/compressed-folders.debian.patch"
  patch -Np1 -i "${srcdir}/Muttrc.patch"
  patch -Np1 -i "${srcdir}/Md.etc_mailname_gethostbyname.patch"
  patch -Np1 -i "${srcdir}/use_usr_bin_editor.patch"
  patch -Np1 -i "${srcdir}/correct_docdir_in_man_page.patch"
  patch -Np1 -i "${srcdir}/dont_document_not_present_features.patch"
  patch -Np1 -i "${srcdir}/document_debian_defaults.patch"
  patch -Np1 -i "${srcdir}/assumed_charset-compat.patch"
  patch -Np1 -i "${srcdir}/467432-write_bcc.patch"
  patch -Np1 -i "${srcdir}/566076-build_doc_adjustments.patch"
  patch -Np1 -i "${srcdir}/define-pgp_getkeys_command.patch"
  patch -Np1 -i "${srcdir}/gpg.rc-paths.patch"
  patch -Np1 -i "${srcdir}/smime.rc.patch"
  patch -Np1 -i "${srcdir}/fix-configure-test-operator.patch"
  patch -Np1 -i "${srcdir}/531430-imapuser.patch"
  patch -Np1 -i "${srcdir}/543467-thread-segfault.patch"
  patch -Np1 -i "${srcdir}/548577-gpgme-1.2.patch"
  patch -Np1 -i "${srcdir}/553321-ansi-escape-segfault.patch"
  patch -Np1 -i "${srcdir}/528233-readonly-open.patch"
  patch -Np1 -i "${srcdir}/228671-pipe-mime.patch"
  patch -Np1 -i "${srcdir}/383769-score-match.patch"
  patch -Np1 -i "${srcdir}/603288-split-fetches.patch"
  patch -Np1 -i "${srcdir}/611410-no-implicit_autoview-for-text-html.patch"
  patch -Np1 -i "${srcdir}/path_max.patch"
  patch -Np1 -i "${srcdir}/sidebar.patch"
  patch -Np1 -i "${srcdir}/sidebar-dotpathsep.patch"
  patch -Np1 -i "${srcdir}/sidebar-utf8.patch"
  patch -Np1 -i "${srcdir}/multiple-fcc.patch"
  patch -Np1 -i "${srcdir}/sidebar-newonly.patch"
  patch -Np1 -i "${srcdir}/sidebar-delimnullwide.patch"
  patch -Np1 -i "${srcdir}/sidebar-compose.patch"
  patch -Np1 -i "${srcdir}/sidebar-new.patch"
  patch -Np1 -i "${srcdir}/nntp.patch"
  patch -Np1 -i "${srcdir}/ats.date_conditional.patch"

  autoreconf -vfi
}

build() {
  cd "${srcdir}/mutt-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --mandir=/usr/share/man \
    --with-docdir=/usr/share/doc/mutt-patched \
    --with-mailpath=/var/mail \
    --disable-dependency-tracking \
    --enable-compressed \
    --enable-debug \
    --enable-fcntl \
    --enable-gpgme \
    --enable-hcache \
    --enable-imap \
    --enable-pop \
    --enable-smtp \
    --with-curses \
    --with-gss \
    --with-idn \
    --with-mixmaster \
    --without-bdb \
    --without-gdbm \
    --without-qdbm \
    --with-regex \
    --with-sasl \
    --with-gnutls

  make
}

package() {
  cd "${srcdir}/mutt-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm "${pkgdir}"/etc/mime.types{,.dist}
  rm "${pkgdir}"/usr/bin/{flea,muttbug}
  rm "${pkgdir}"/usr/share/man/man1/{flea,muttbug}.1
  install -D -m 644 contrib/gpg.rc "$pkgdir"/etc/Muttrc.gpg.dist
}
