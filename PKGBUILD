# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=rainbow
pkgver=2.7.1
pkgrel=1
pkgdesc="Colorize commands output or STDIN using patterns."
arch=(any)
url="https://github.com/nicoulaj/rainbow"
license=(GPL3)
depends=(python)
makedepends=('python-setuptools'
             'python-jinja')
changelog=Changelog
provides=('rainbow-git')
conflicts=('rainbow-git')
source=("https://files.pythonhosted.org/packages/source/r/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('cbf27d4ff928b32ad5550917715255e3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  
  install -v -m755 -d "${pkgdir}/etc/bash_completion.d"
  install -v -m644 build/completion/rainbow "${pkgdir}/etc/bash_completion.d/"
  
  install -v -m755 -d "${pkgdir}/usr/share/zsh/site-functions"
  install -v -m644 build/completion/_rainbow "${pkgdir}/usr/share/zsh/site-functions/"
  
  install -v -m755 -d "${pkgdir}/usr/share/man/man1"
  install -v -m644 build/man/rainbow.1.gz "${pkgdir}/usr/share/man/man1/"
}
