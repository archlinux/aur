# Maintainer: Darren Wu <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
# Thanks: Florian Knodt <git [at] adlerweb [dot] info>
# Thanks: Marco Kundt <mrckndt@gmail.com>

pkgname=stcgal-git
pkgver=v1.6.r1.8e31765
pkgrel=1
pkgdesc="Open Source STC MCU ISP flash tool"
arch=('any')
url="https://github.com/grigorig/stcgal"
license=('MIT')
depends=('python-pyserial'
         'python-tqdm')
optdepends=('python-pyusb: Native USB programming support')
makedepends=('git'
             'python-setuptools')
source=('stcgal::git+https://github.com/grigorig/stcgal.git'
        'LICENSE') # https://aur.archlinux.org/cgit/aur.git/plain/LICENSE?h=stcgal
md5sums=('SKIP'
         'b76a68fb137f36d7b43624a0fe99cb2c')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')" # Git, tags available
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}