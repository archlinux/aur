# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

pkgname=backblaze-b2
_pkgname=B2_Command_Line_Tool
pkgver=2.0.2
pkgrel=1
pkgdesc="Backblaze B2 Command Line Client"
url='https://github.com/Backblaze/B2_Command_Line_Tool'
depends=('python'
         'python-b2sdk>=1.0.0'
         'python-six>=1.10'
         'python-tqdm>=4.5.0'
         'python-logfury'
        )
optdepends=()
# MIT or Creative Commons: https://www.backblaze.com/using_b2_code.html
license=('MIT')
arch=('any')

source=("https://github.com/Backblaze/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('0e0ebf698f49de00cb530bd0928855058fc6d1f4aaeb0b7b1bbea475e6e3f2add8c7acd9a75baf348907646eedc199b9729e1777bfb4a4e63952782a74c749dc')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}

    python setup.py build
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    # https://wiki.archlinux.org/index.php/Python_package_guidelines
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/

    # Installed to backblaze-b2 because the Boost pkg installs /usr/bin/b2
    mv ${pkgdir}/usr/bin/b2 ${pkgdir}/usr/bin/backblaze-b2
}
