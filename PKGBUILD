# Maintainer: Hildigerr Vergaray <Maintainer at YmirSystems dot com>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=rebol
pkgver=2.7.8
pkgrel=5
pkgdesc="A cross-platform data exchange language and a multi-paradigm dynamic programming language"
arch=('i686' 'x86_64')
url="http://www.rebol.com/"
license=('custom:REBOL End User License')
groups=('devel')
provides=('rebol')
options=('!strip')

if [ "$CARCH" == x86_64 ]; then
  source=("http://www.rebol.com/downloads/v278/rebol-core-278-4-10.tar.gz")
  md5sums=('a4fa54e3858e016d253e6e8accb96012')
  _targetdir="rebol-core"
else
  source=("http://www.rebol.com/downloads/v278/rebol-core-278-4-3.tar.gz")
  md5sums=('0918513c5e30209c36a88bcf446ddd77')
  _targetdir="releases/rebol-core"
fi

build(){
  cd "$srcdir/$_targetdir"
  ./rebol -q --do "license quit" > license.eula
}

package() {
  cd "$srcdir/$_targetdir"
  install -Dm755 rebol $pkgdir/usr/bin/rebol 
  install -Dm644 license.eula "$pkgdir"/usr/share/licenses/"$pkgname"/license.eula
}

# vim:set ts=2 sw=2 et:
