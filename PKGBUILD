# Maintainer: Taiki Sugawara <buzz.taiki@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: TuxSpirit<tuxspirit@archlinux.fr>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=p7zip-full-bin
_pkgname=p7zip-full
pkgver=23.01
pkgrel=1
_upstream_pkgrel=4
pkgdesc="Command-line file archiver with high compression ratio, based on libnatspec patch from ubuntu zip-i18n PPA (https://launchpad.net/~frol/+archive/zip-i18n)."
arch=('x86_64')
url="https://github.com/phoepsilonix/p7zip-full"
license=('LGPL' 'custom:unRAR')
depends=()
conflicts=('p7zip')
provides=('p7zip')
source=(https://github.com/phoepsilonix/p7zip-full/archive/refs/tags/v$pkgver.$_upstream_pkgrel.tar.gz
        https://github.com/phoepsilonix/p7zip-full/releases/download/v$pkgver.$_upstream_pkgrel/p7zip-linux-x86_64-musl.zip)
sha256sums=('e62c548f8e76a8493010a91feee9e632bf3599a26f2b9433b49a4d91014a1d42'
            '508289c2d15908b366f4e94de32db0433367eb25f8d46be87faa6773cc8769ee')

prepare() {
  cd $_pkgname-$pkgver.$_upstream_pkgrel
  mkdir -p bin/
}

build() {
  cd $_pkgname-$pkgver.$_upstream_pkgrel
  cp -a ${srcdir}/p7zip bin/

}

package() {
  cd $_pkgname-$pkgver.$_upstream_pkgrel

  make install \
    DEST_DIR="$pkgdir" \
    DEST_HOME=/usr \
    DEST_MAN=/usr/share/man

  # Remove documentation for the GUI file manager
  rm -r "$pkgdir/usr/share/doc/p7zip/DOC/MANUAL/fm"

  install -d "${pkgdir}"/usr/share/licenses/p7zip
  ln -s -t "$pkgdir/usr/share/licenses/p7zip/" \
    /usr/share/doc/p7zip/DOC/License.txt \
    /usr/share/doc/p7zip/DOC/unRarLicense.txt
}

# vim:set ts=2 sw=2 et:
