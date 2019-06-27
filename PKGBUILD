# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: Alexander Scharinger
# Contributor: Tristan Webb <t2webb@ucsd.edu>
# Contributor Sindwiller
pkgname=pyspread
pkgver=1.1.3
pkgrel=1
pkgdesc="A cross-platform Python spreadsheet application. Python 2.7 version"
arch=('any')
url="https://manns.github.io/pyspread/"
license=('GPL3')
depends=('python2-numpy>=1.1.0'
        'wxpython' # needs pycairo patch
        'python2-matplotlib'
        'python2-cairo'
        'python2-gnupg')
optdepends=('python2-gnupginterface: for opening files without approval' # in AUR
            'python2-xlrd: open Excel files' # in Community
            'python2-xlwt: save Excel files' # in Community
            'python2-jedi: TAB autocompletion and context help in the entry line' # in Community
            'python2-basemap: for the weather example' # in Community
            'python2-pyenchant:  for spell checking') # in Community
# The pyspread website lists another optional dependency: pyrsvg>=2.32, for
# displaying SVG files in cells. But pyrsvg is included in cairo (from the
# mandatory dependencies).
# See: https://manns.github.io/pyspread/download.html and on this site follow
# link to pyrsvg.
options=(!emptydirs)
source=("https://github.com/manns/pyspread/archive/v${pkgver}.tar.gz"
        "$pkgname.desktop")
sha512sums=('e9be7edfede1d150fbe72edf9eab16ce39c3d3fb844345628194541d2386a33203a18d8081b02b8ee7b7821a35f0990da01225256dbdfc353f64eeae4738a534'
            '9411c1c4c9c68132bdc05fc028b4a3d1dade65502a21c64bcd093f94fe7ed6e7dee3f34a2a423da263f73dd5f20c1fcbfb0734ec60e5789057296dd8d48895d2')

package() {  
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root=$pkgdir/ --optimize=1
  mv $pkgdir/usr/lib/python2.7/site-packages/{changelog,README} \
     $pkgdir/usr/lib/python2.7/site-packages/pyspread/
  install -D "$pkgdir/usr/lib/python2.7/site-packages/pyspread/share/icons/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -D -m644 "${srcdir}/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

