# Maintainer: Mantas Mikulėnas <grawity@gmail.com>

pkgname='lbe'
pkgver=2.8.2
pkgrel=6
pkgdesc="Jarek Gawor's LDAP Browser/Editor (last freeware version)"
arch=('any')
#url="http://www.openchannelsoftware.com/projects/LDAP_Browser_Editor"
url="http://web.archive.org/web/20090201080715/http://mcs.anl.gov/~gawor/ldap/"
license=('custom')
depends=('java-runtime=8')
source=("https://nullroute.lt/mirrors/files/ldapbrowser-$pkgver.zip"
        "lbe.desktop"
        "lbe.sh")
noextract=("ldapbrowser-$pkgver.zip")
sha256sums=('6c1a1b80b81d83f005d4a006bc070b1b8f44f90151f7af6b14004c96e26687ec'
            'ccdc18f2879c6ab10aa0f3ad087a3aa225a6146340be7e2fb46302b961255972'
            'a7a2010364196bae2fcd0db00e374a289ea9b0eee4d64f5dac9f88520aacd967')

prepare() {
  # Extract the archive manually into a subfolder
  mkdir -p "ldapbrowser-$pkgver"
  bsdtar -x -v -C "ldapbrowser-$pkgver" -f "ldapbrowser-$pkgver.zip"
}

package() {
  mkdir -p "$pkgdir/usr/lib"
  cp -a "$srcdir/ldapbrowser-$pkgver" "$pkgdir/usr/lib/lbe"

  {
    echo
    echo "# added by packager"
    echo "krbextradata=binary"
    echo "krbprincipalkey=binary"
  } >> "$pkgdir/usr/lib/lbe/attributes.config"

  install -Dm755 "$srcdir/lbe.desktop"   "$pkgdir/usr/share/applications/lbe.desktop"
  install -Dm755 "$srcdir/lbe.sh"        "$pkgdir/usr/bin/lbe"
}

# vim: ts=2:sw=2:et
