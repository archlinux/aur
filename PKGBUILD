# Maintainer : yjun <jerrysteve1101@gmail.com>
# Contributor: Darren Wu <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
# Thanks: Florian Knodt <git [at] adlerweb [dot] info>
# Thanks: Marco Kundt <mrckndt@gmail.com>

pkgname=stcgal-git
_pkgname=${pkgname%-git}
pkgver=v1.6.r41.2d3c24f
pkgrel=1
pkgdesc="Open Source STC MCU ISP flash tool"
arch=('any')
url="https://github.com/grigorig/stcgal"
license=('MIT')
depends=('python-pyserial'
         'python-tqdm')
makedepends=('git'
             'python-setuptools')
optdepends=('python-pyusb: Native USB programming support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('stcgal::git+https://github.com/grigorig/stcgal.git'
        'LICENSE') # https://aur.archlinux.org/cgit/aur.git/plain/LICENSE?h=stcgal
sha256sums=('SKIP'
            'febf76eb588a5ac4db2fe052c5aadc85a3a8ae90197d9eafdcf400574eb4302e')

pkgver() {
  cd "$srcdir/${_pkgname}"
  
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')" # Git, tags available
}

build() {
  cd "$srcdir/${_pkgname}"
  
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}"

  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
