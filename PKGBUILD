# Maintainer: RG <jeffguorg@gmail.com>
pkgname=('python-pipreqs'  'python2-pipreqs')
pkgver=0.4.9
pkgrel=1
pkgdesc="Pip requirements.txt generator based on imports in project"
arch=('any')
url="https://github.com/bndr/pipreqs"
license=('Apache License 2.0')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=('https://pypi.python.org/packages/67/63/84409df1acd879d239e53599de2b3df45013e6cf46406fd94e86822635f3/pipreqs-0.4.9.tar.gz')
md5sums=('daf927ef489ccc83ff8fffe922c10f11')

package_python-pipreqs() {
  depends=('python' 'python-wheel' 'python-docopt' 'python-yarg')
  cd "$srcdir/pipreqs-$pkgver"
  python setup.py install --prefix="/usr" --root="$pkgdir/" --optimize=1
  sed -i "s|#!/usr/bin/python$|#!/usr/bin/env python|" \
    ${pkgdir}/usr/bin/pipreqs
}
package_python2-pipreqs() {
  depends=('python2' 'python2-wheel' 'python2-docopt' 'python2-yarg')
  cd "$srcdir/pipreqs-$pkgver"
  python2 setup.py install --prefix="/usr" --root="$pkgdir/" --optimize=1
  sed -i "s|#!/usr/bin/python$|#!/usr/bin/env python2|" \
    ${pkgdir}/usr/bin/pipreqs
  mv "$pkgdir/usr/bin/pipreqs" "$pkgdir/usr/bin/pipreqs2"
  sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|" \
    ${pkgdir}/usr/lib/python2.7/site-packages/pipreqs/pipreqs.py
}

# vim:set ts=2 sw=2 et:
