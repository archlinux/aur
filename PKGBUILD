# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgname=duplex
pkgver=0.3.1.1
pkgrel=1
pkgdesc='Duplex Printing Emulation System'
arch=('any')
url='https://sourceforge.net/projects/duplexpr/'
license=('GPL2')
depends=('cups' 'yad' 'enscript' 'poppler' 'ghostscript')
optdepends=('xclip: Clipboard support' 'trash-cli:  Move to trash support')
source=(
	'https://sourceforge.net/projects/duplexpr/files/duplex_0_3_1_1.tar.gz'
	'duplex.patch')
sha512sums=(
	'b9ba396e672ede5f436f0b1e124f84fe8f28fdf109652c5ae1be4ef4c52493d444586db54860753cbbc6ec1623fa190603abcd4a0d13597f620b49caf5503feb'
	'2d5864ee4821073ed0216d248dc455a70cd98f454034c38075203205ab42e98cd02c7c33d0f73298642d3437bf7142d229b2c56e9881783db9e6efa754bc66e4')

prepare() {
  cd "$srcdir/duplex_0_3_1_1"
  patch --strip=1 --input=../duplex.patch
}

package() {
  install -dm 755 "${pkgdir}"/{usr/share/duplex,usr/share/licenses/duplex,usr/bin/}
  cd "$srcdir/duplex_0_3_1_1"
  cp -dr --no-preserve='ownership' dplx duplex dot.duplexpr Test_File.pdf klprm kmprb kmprb_one kmprbatches krmpq mpr mprb dprint dprintf dprintm rmpq pqnext "${pkgdir}"/usr/share/duplex/
  cp -dr --no-preserve='ownership' license.txt "${pkgdir}"/usr/share/licenses/duplex
  ln -sf /usr/share/duplex/dplx "${pkgdir}"/usr/bin/duplex
}
