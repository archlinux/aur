# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=volgarr-the-viking-hib
pkgver=1.34
pkgrel=1
pkgdesc="Hardcore 16-bit style action from the golden era of arcade games, reimagined for today!"
url="http://www.volgarrtheviking.com/"
license=('custom: commercial')
arch=('x86_64' 'i686')
depends=('sh')
depends_i686=('sdl2' 'libgl')
depends_x86_64=('lib32-sdl2' 'lib32-libgl')
source=("hib://VolgarrTheViking_v${pkgver}_Linux32.tar.gz"
        "$pkgname.sh")
sha256sums=('e99e42b0dade244080ac17717c1a5caf292b5d2a57d5d3e659eae52e00eca6de'
            '246282e4132b7a8ae25d22aa926ee651164420776b321a69f9a4385a2ec7724a')
PKGEXT=".pkg.tar"

# You need to download the Humble Bundle file manually or you can configure
# DLAGENTS in makepkg.conf to auto-download.
#
# For example, hib-dlagent (https://aur.archlinux.org/packages/hib-dlagent/)
# can be used to download files. Add something like this in your makepkg.conf
# (you need to tweak the options to your needs):
# DLAGENTS+=('hib::/usr/bin/hib-dlagent -k $KEY -u $USER -p $PASS -o %o %u')
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=("hib::/usr/bin/echo %u - This is is not a real URL, you need to download the humble bundle file manually to \"$PWD\" or setup a hib:// DLAGENT. Read this PKGBUILD for more information.")

package() {
  install -d "$pkgdir"/opt/volgarr-the-viking
  # data
  install -m644 Volgarr/{Data.pk,icon.png,Readme.txt} "$pkgdir"/opt/volgarr-the-viking
  # binary
  install -m755 Volgarr/Volgarr "$pkgdir"/opt/volgarr-the-viking
  # launcher
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/volgarr-the-viking
  # doc
  install -d "$pkgdir"/usr/share/doc/volgarr-the-viking
  ln -s /opt/volgarr-the-viking/Readme.txt "$pkgdir"/usr/share/doc/volgarr-the-viking
}
