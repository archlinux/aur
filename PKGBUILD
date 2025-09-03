# Maintainer: Lucas Gabriel <g at 11xx dot org>
pkgname=simp1e-amber-hyprcursor
__themename=(simp1e-amber simp1e-amber-neron)
pkgver=0.3
# simp1e-amber-hyprcursor is using a different version number. No special reason why, sry :p
__simp1eAmberVer=0.1
pkgrel=2
pkgdesc="Two gold-yellow hyprcursor themes ('simp1e-amber' and 'simp1e-amber-neron'). Xcursor versions also provided as fallback."
arch=('x86_64')
url="https://codeberg.org/useless-utils/simp1e-amber-hyprcursor"
license=('GPL-3.0-or-later')
makedepends=(zstd libarchive)
source=(
${__themename[0]}-hyprcursor-$__simp1eAmberVer.tar.zst::https://codeberg.org/useless-utils/$pkgname/releases/download/$pkgver/${__themename[0]}-hyprcursor-$__simp1eAmberVer.tar.zst
${__themename[0]}-xcursor.tar.zst::https://codeberg.org/useless-utils/$pkgname/releases/download/$pkgver/${__themename[0]}-xcursor.tar.zst
${__themename[1]}-hyprcursor-$pkgver.tar.zst::https://codeberg.org/useless-utils/$pkgname/releases/download/$pkgver/${__themename[1]}-hyprcursor-$pkgver.tar.zst
${__themename[1]}-xcursor.tar.zst::https://codeberg.org/useless-utils/$pkgname/releases/download/$pkgver/${__themename[1]}-xcursor.tar.zst
)
sha256sums=('0f2cdca43f023cde77f3bf13acd84bd1b9a89b0799d7650775dbc5a804f97248'
            'd4aa004dfe3746d1c09a9840c6740d21246acd7f10f3991149804b54bcc82543'
            'efef3f50fe467c2fa8197193d9dbac1ec167dd1a17f4f39b2790847939984593'
            '690a5cc44964d23d65efb15c99c87e3765974be283261ce2164ee90be88befd0')

prepare() {
  bsdtar -xf "$srcdir/${__themename[0]}-hyprcursor-$__simp1eAmberVer.tar.zst"
  bsdtar -xf "$srcdir/${__themename[0]}-xcursor.tar.zst"
  bsdtar -xf "$srcdir/${__themename[1]}-hyprcursor-$pkgver.tar.zst"
  bsdtar -xf "$srcdir/${__themename[1]}-xcursor.tar.zst"
}


package() {
  install -dm755 "$pkgdir/usr/share/icons/"

  # hyprcursor
  cp -a --no-preserve=ownership -t "$pkgdir/usr/share/icons/" "$srcdir/${__themename[0]}-hyprcursor"
  cp -a --no-preserve=ownership -t "$pkgdir/usr/share/icons/" "$srcdir/${__themename[1]}-hyprcursor"

  # xcursor dir = themename bc that's how it gets theme names for use in e.g. gsettings
  cp -a --no-preserve=ownership -t "$pkgdir/usr/share/icons/" "$srcdir/${__themename[0]}"
  cp -a --no-preserve=ownership -t "$pkgdir/usr/share/icons/" "$srcdir/${__themename[0]}-left"
  cp -a --no-preserve=ownership -t "$pkgdir/usr/share/icons/" "$srcdir/${__themename[1]}"
  cp -a --no-preserve=ownership -t "$pkgdir/usr/share/icons/" "$srcdir/${__themename[1]}-left"
}

post_install() {
  cat <<EOF
${pkgname}: Use "${_themename[0]}" or "${_themename[1]}" as cursor theme.
EOF
}

post_upgrade() {
  post_install
}
