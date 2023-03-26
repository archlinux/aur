# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='simplex-chat-bin'
_pkgname="${pkgname%%-bin}"
pkgver=4.6.0
pkgrel=1
pkgdesc='A 100% private-by-design chat platform (pre-compiled)'
arch=('x86_64')
_platform='ubuntu-20_04-x86-64'
url='https://simplex.chat/'
_rawurl='https://raw.githubusercontent.com/simplex-chat/simplex-chat/master'
source=(
  "$_pkgname-$pkgver::https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver/$_pkgname-$_platform"
  "$_rawurl/PRIVACY.md"
  "$_rawurl/README.md"
  "$_rawurl/docs/CLI.md"
  "$_rawurl/docs/SIMPLEX.md"
  "$_rawurl/docs/SQL.md"
  "$_rawurl/scripts/message_views.sql"
  'logo-symbol-dark.svg'
  'logo-symbol-light.svg'
  'simplex-chat.desktop'
)
license=('AGPL3')
depends=(
  'glibc'
  'gmp'
  'hicolor-icon-theme'
  'openssl-1.1'
  'zlib'
)
provides=('simplex-chat')
conflicts=('simplex-chat')

build() {
  case "${SIMPLEX_ICON:-light}" in
    light ) _shade='light'; _other='dark'  ;;
     dark ) _shade='dark' ; _other='light' ;;
        * ) _shade='light'; _other='dark'  ;;
  esac

  cat <<EOF
Will package an icon suitable for a $_shade theme. If this is
not what you want, set the environment variable \$SIMPLEX_ICON
to “$_other”. E.g.:

  env SIMPLEX_ICON=$_other makepkg [options …]
EOF

  cp "logo-symbol-$_shade.svg" "$_pkgname.svg"
}

package() {
  cd "$srcdir" || exit 1

  install -Dm0755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
  install -Dm0644  message_views.sql "$pkgdir/usr/share/doc/$_pkgname/message_views.sql"
  install  -m0644 {PRIVACY,README,CLI,SIMPLEX,SQL}.md "$pkgdir/usr/share/doc/$_pkgname/"
  install -Dm0644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm0644 "$_pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
}

sha256sums=(
  'f1c8c20ab788a336c64470e5ef89390228a665f0a1331c29d77c575a9e34156f'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)
sha512sums=(
  '93391282380858d29e6f8f008f56d6e2a4a1265af21ad743a8e40ae146415b50db228b3ba51319d2efc73fecef8551d7bd305c91060042870de7504cc83af4a7'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  'd8979b0be1d2df3ae93f5a64f9cf277a9d7975c5b209b4bff4222fa0c114af575c763dc0a4c905b04bf9e4242cdb8d7e6af66841e55757378311a77cc21f6ca4'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)

# eof
