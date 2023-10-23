# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='simplex-chat-bin'
_pkgname="${pkgname%%-bin}"
epoch=1
pkgver=5.3.2
pkgrel=1
pkgdesc='A 100% private-by-design chat platform (pre-compiled)'
arch=('x86_64')
_platform='ubuntu-22_04-x86-64'
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
  'openssl'
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

sha512sums=(
  '4678fb763d33e904a03c163f0092b05f0ecf9b95ea507188091259cd7bfd6d7d1508c2f90b34fd87e9946e47fd1bf40c2659661e183cb1fdeb3254f214658767'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)

# 🪷 Beyond the Known — 365 Days of Exploration
#
# 📆 23rd October
#
# There are no higher or lower states.
#
# There is only the state you are in.
#
# 🔗 https://magnetic-ink.dk/users/btk

# eof
