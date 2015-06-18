# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: Peter Wu <peter@lekensteyn.nl>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: s1gma <s1gma@mindslicer.com>

pkgname=binwalk
pkgver=2.0.1
pkgrel=4
pkgdesc="A tool for searching a given binary image for embedded files"
url="http://binwalk.org"
arch=('i686' 'x86_64')
license=('MIT')
depends=('python')
optdepends=(
  'python-pyqtgraph: graph and visualization support'
  'python-opengl: binviz module support'
  'arj: ARJ decompression support'
  'cabextract: CAB archive support'
  'cpio: CPIO archvie support'
  'gzip: GZIP decompression support'
  'lha: LHA decompression support'
  'mtd-utils: JFFS filesystem support'
  'p7zip: ZIP, LZMA and ISO decompression support'
  'squashfs-tools: squashfs support'
  'tar: TAR archive support'
  'unrar: RAR decompression support'
  'xz: XZ decompression support'
  'firmware-mod-kit: cramfs support'
)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/devttys0/${pkgname}/archive/v${pkgver}.tar.gz
        replace-java.patch)
sha512sums=('de223f61a0a212469c21b8e36d02cadc83f1cdb96a0f6114490d15d8dc12c93a86b46ef74379acb96b32b305e75ca66e940d7a18a8dc3b5036ebe8946dcca0f3'
            '743caf39ce5ca0bc7573e0600815bbf4932522b9235b7f35187483030c6148d52ab1946f1ec20bf43f9c040576365beb714afe384c4d7485d87463cf25668234')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p0 < ../replace-java.patch
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --disable-bundles --prefix="${pkgdir}/usr"
  make build
}

package() {
  cd ${pkgname}-${pkgver}
  make install
  python setup.py install -O1 --prefix="${pkgdir}/usr"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 *.md "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
