# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

pkgname=python-rst2ansi
_pkgname=rst2ansi
pkgver=0.1.5
pkgrel=3
pkgdesc='Module rendering RST (reStructuredText) to strings suitable for a terminal.'
arch=(any)
url='https://github.com/Snaipe/python-rst2ansi'
license=('MIT')
depends=('python'
         'python-setuptools'
        )

source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('1b17fb9a628d40f57933ad1a3aa952346444be069469508e73e95060da33fe6f')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  python setup.py install --root=${pkgdir} --optimize=1

  # Not included in PyPi package, but available from Github
  #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

   # https://wiki.archlinux.org/index.php/Python_package_guidelines
   local site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
   rm -rf "${pkgdir}${site_packages}/test"
}
