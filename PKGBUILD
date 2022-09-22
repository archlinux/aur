# Maintainer: Mantas Mikulėnas <grawity@gmail.com>

pkgname='lbe'
pkgver=2.8.2
pkgrel=9
pkgdesc="Jarek Gawor's LDAP Browser/Editor (last freeware version)"
arch=('any')
#url="http://www.openchannelsoftware.com/projects/LDAP_Browser_Editor"
url="http://web.archive.org/web/20090201080715/http://mcs.anl.gov/~gawor/ldap/"
license=('custom')
depends=('java-runtime>=8' 'java-runtime<=11')
source=("https://nullroute.lt/mirrors/files/ldapbrowser-$pkgver.zip"
        "lbe.desktop"
        "lbe.sh")
sha256sums=('6c1a1b80b81d83f005d4a006bc070b1b8f44f90151f7af6b14004c96e26687ec'
            'ccdc18f2879c6ab10aa0f3ad087a3aa225a6146340be7e2fb46302b961255972'
            '066aa536497ba582b5222548c982477ef894ce9ddc46db52b3a63971a67b40c5')

package() {
  # Java program files
  mkdir -p "$pkgdir"/usr/lib/lbe
  cp -av lbe.jar lib "$pkgdir"/usr/lib/lbe/

  # Initial config directory
  mkdir -p "$pkgdir"/usr/share/lbe/skel
  cp -av attributes.config templates "$pkgdir"/usr/share/lbe/skel/
  cp -av help/uofmichigan.cfg.sample "$pkgdir"/usr/share/lbe/skel/'U of Michigan'.cfg
  ln -s /etc/ssl/certs/java/cacerts "$pkgdir"/usr/share/lbe/skel/lbecacerts
  {
    echo
    echo "# Added by packager"
    echo "krbextradata=binary"
    echo "krbprincipalkey=binary"
  } >> "$pkgdir"/usr/share/lbe/skel/attributes.config

  # Docs
  mkdir -p "$pkgdir"/usr/share/doc/lbe
  cp -av *.html help CHANGES.TXT "$pkgdir"/usr/share/doc/lbe/

  # Licenses
  mkdir -p "$pkgdir"/usr/share/licenses/lbe
  cp -av LICENSE.ICONS "$pkgdir"/usr/share/licenses/lbe/

  install -Dm755 "$srcdir"/lbe.desktop   "$pkgdir"/usr/share/applications/lbe.desktop
  install -Dm755 "$srcdir"/lbe.sh        "$pkgdir"/usr/bin/lbe
}

# vim: ts=2:sw=2:et
