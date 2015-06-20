# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=dynamitejack
pkgver=1.0.23
pkgrel=1
pkgdesc='Use only bombs and a flashlight to escape to freedom (game sold separately)'
url='http://www.galcon.com/dynamitejack/'
license=('custom')
arch=('i686' 'x86_64')
if [ "$CARCH" == "x86_64" ]; then
  depends=('lib32-glu' 'lib32-mesa' 'lib32-sdl')
else
  depends=('glu' 'mesa' 'sdl')
fi
source=("hib://${pkgname}-${pkgver}.tgz"
        "${pkgname}.desktop"
        "${pkgname}.png::https://humblebundle-a.akamaihd.net/misc/files/hashed/c96d16d4598c839d39a580422bb828ba01fa6b46.png"
        "${pkgname}.sh")
md5sums=('72eeb2829c98c16c308d13d54144515e'
         'bd2a35f46506c078261eedbd4887739c'
         'afefd46bea9bd595bc9d8ae0c2f47607'
         '7e01e4e7fa0d5e68553837ea1aacbc49')
options=('!strip')
# You can download the Humble Indie Bundle file manually, or you can configure
# DLAGENTS in makepkg.conf to auto-download.
#
# For example, to use hib-dlagent to download files set something like this in
# your makepkg.conf (change/add -k and add -u/-p to your needs):
# DLAGENTS=('hib::/usr/bin/hib-dlagent -k 1a2b3c -o %o $(echo %u | cut -c 7-)')
#
# To auto-search through a directory containing Humble Bundle downloads, you
# could set:
# DLAGENTS=('hib::/usr/bin/find /path/to/downloads -name $(echo %u | cut -c 7-) -exec ln -s \{\} %o \; -quit')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Download the file manually to \"$(pwd)\" or setup hib:// DLAGENT in /etc/makepkg.conf"; echo "Read this PKGBUILD for more info."; exit 1')
PKGEXT='.pkg.tar'

package() {
  cd "${srcdir}/${pkgname}"

  install -d "${pkgdir}/opt/"
  cp -rl . "${pkgdir}/opt/${pkgname}"

  install -d "${pkgdir}/usr/bin/"
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" \
      "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/opt/${pkgname}/"
}
