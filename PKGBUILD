# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=rainbow
pkgver=2.8.0
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
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f150efa649f13e9abbe75c6390519da109ad8fd06d62d5508d3a163a1fb2b5b9')

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
