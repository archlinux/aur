# Maintainer: willemw <willemw12@gmail.com>

pkgname=iwscanner
pkgver=0.2.4
pkgrel=6
pkgdesc="Wireless scanner with an easy to use graphic interface and using the iwlist tool"
arch=('any')
url="http://kuthulu.com/iwscanner"
license=('LGPL')
depends=('pygtk' 'python2' 'wireless_tools')
optdepends=('gksu: privilege escalation to use wireless tools'
            'kde-cli-tools: privilege escalation (kdesu) to use wireless tools')
options=(!emptydirs)
# Additional source files are based on the openSUSE 'iwscanner' RPM
source=(http://kuthulu.com/iwscanner/iwscanner-$pkgver.tgz
        iwscanner
        iwscanner.desktop
        setup.py)
md5sums=('436d37e5a1bf2d26bcd0e77e2ebaeb3a'
         'a7a7fb1ca440e000ef97c96515be29db'
         'd0613547024a89444c34ef2b34d8427c'
         '470cb6fb4539e7d580086178304c95a9')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's|#!/usr/bin/env python[ ]*$|#!/usr/bin/env python2|' iwscanner.py
  sed -i 's|app_version = "0.2.3"|app_version = "0.2.4"|' iwscanner.py
}

package() {
  install -Dm644 iwscanner.desktop "$pkgdir/usr/share/applications/iwscanner.desktop"

  cd $pkgname-$pkgver
  python2 ../setup.py install --root="$pkgdir/" --optimize=1
}

