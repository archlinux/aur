# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: Peter Wu <peter@lekensteyn.nl>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: s1gma <s1gma@mindslicer.com>

pkgname=binwalk-git
_gitname=binwalk
pkgver=2.1.0.688.02dd825
pkgrel=1
pkgdesc="A tool for searching a given binary image for embedded files"
url="http://binwalk.org"
arch=('any')
license=('MIT')
depends=('python')
optdepends=(
  'python-pyqtgraph: graph and visualization support'
  'python-opengl: binviz module support'
  'python-capstone: disassembly support'
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
makedepends=('git')
provides=('binwalk')
conflicts=("binwalk")
source=(${pkgname}::git+https://github.com/devttys0/${_gitname})
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(python setup.py --version)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}
  python setup.py build
}

package() {
  cd ${pkgname}
  python setup.py install -O1 --prefix="${pkgdir}/usr"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 *.md "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
