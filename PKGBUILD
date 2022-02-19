# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=superpaper
pkgname=${_pkgname}-git
pkgver=2.1.0+25+gfaba0e6
pkgrel=1
pkgdesc="Cross-platform multi monitor wallpaper manager"
arch=('any')
url="https://github.com/hhannine/Superpaper"
license=('MIT')
depends=('python-pillow>=7.0' 'python-screeninfo>=0.6.1' 'python-wxpython'
         'python-system_hotkey>=1.0.2+10+9541587' 'python-xpybutil' 'python-numpy')
makedepends=('python-setuptools' 'git')
provides=("${_pkgname}=${pkgver%%+}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/hhannine/${_pkgname^}"
        'python3.10_List_fix.patch'
        # Get rid of this when wxpython 4.1.x is introduced
        'wxpython_4.0.x_wx_no_attribute_PU_CONTAINS_CONTROLS.patch')
sha256sums=('SKIP'
            'ed1be7af574a50912dfd9abe69150d386c40ef3ecc44ec4d143480e49958c19d'
            'd37d70bcd024a43a5e9b2215bedd9545c4fc64025906b70bd084ee7071db11d7')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r "s/^v//;s/-/+/g"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -uNp2 -r- -i ../python3.10_List_fix.patch
  patch -uNp2 -r- -i ../wxpython_4.0.x_wx_no_attribute_PU_CONTAINS_CONTROLS.patch
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root "${pkgdir}" --optimize=1
}
