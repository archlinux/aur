# Maintainer: Jenya Sovetkin <e.sovetkin at gmail com>
pkgname=qasm2circ
pkgver=1.4
pkgrel=1
pkgdesc="Quantum circuit viewer"
arch=(any)
license=('unknown')
url="http://www.media.mit.edu/quanta/qasm2circ/"
depends=('python2')
optdepends=('ghostscript' 'netpbm' 'texlive-most')
source=('http://www.media.mit.edu/quanta/qasm2circ/qasm2circ-v1.4.tgz'
        'qasm2tex.patch'
        'qasm2pdf.patch'
        'qasm2png.patch')
md5sums=('3621c141703beead2e5a8b007561bf75'
         '6c12a341aca1c1613ebd4c58e306ac44'
         '93b2c20f5dba43b28a63e28a677a7f80'
         'f6adb71b4a8ba1dfcd4572eee5a65c44')

prepare() {
	cd "$pkgname-v$pkgver"
	patch -p1 -i "$srcdir/qasm2tex.patch"
  patch -p1 -i "$srcdir/qasm2pdf.patch"
  patch -p1 -i "$srcdir/qasm2png.patch"
}

package() {
  cd "$pkgname-v$pkgver"

  install -Dm 755 qasm2tex.py "${pkgdir}/usr/bin/qasm2tex"
  install -Dm 755 qasm2pdf "${pkgdir}/usr/bin/qasm2pdf"
  
  ## I didn't manage to make it work yet
  # install -Dm 755 qasm2png "${pkgdir}/usr/bin/qasm2png"
}
