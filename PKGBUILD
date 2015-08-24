# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Marco Elver <el.marcoe+arch at gmail dot com>

pkgname=python-nevow
pkgver=0.11.1
pkgrel=1
arch=(any)
license=('custom')
pkgdesc="Web application construction kit and templating engine written in python."
url="https://github.com/twisted/nevow"
depends=('python2')
optdepends=('python2-twisted: to use all the advanced features of nevow, such as LivePage')
makedepends=('python2-twisted' 'python2-setuptools')
source=("http://pypi.python.org/packages/source/N/Nevow/Nevow-${pkgver}.tar.gz")
md5sums=('acc5d23bd94a5399752065baae6117f6')
options=(!emptydirs)

package() {
  cd $srcdir/Nevow-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1

  # is there a way to fix the doc path with the setup.py script ?
  mkdir -p $pkgdir/usr/share/doc/nevow
  mv $pkgdir/usr/doc/man $pkgdir/usr/share/
  mv $pkgdir/usr/doc/* $pkgdir/usr/share/doc/nevow/
  rm -r $pkgdir/usr/doc

  # Setuptools doesn't kill off #!/usr/bin/python shebangs
  find $pkgdir -name "*.py" -exec \
    sed -i '1s/python[[:space:]]*$/python2/' {} \;

  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

