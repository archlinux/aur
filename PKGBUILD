# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=lostsky-hg
pkgver=1448
pkgrel=1
pkgdesc="Strategy RPG set in the Touhou universe"
arch=(any)
url="http://lostsky.featheredmelody.com/"
license=('BSD')
depends=('python2-pygame' 'python2-xdg')
makedepends=('mercurial')
options=(!emptydirs)
source=('hg+https://bitbucket.org/featheredmelody/lost-sky-project'
        'lostsky.desktop' 'lostsky.png')
md5sums=('SKIP'
         '172768fc13a04740cab8a353d1a4a40a'
         '0c7493aad44dfd09dacca835ea6e3b6a')

pkgver() {
  cd 'lost-sky-project'
  hg identify -n
}

build() {
  cd 'lost-sky-project/Story of a Lost Sky'
  python2 setup.py build
}

package() {
  cd 'lost-sky-project/Story of a Lost Sky'
  python2 setup.py install --root="$pkgdir/" --optimize=1
  mv $pkgdir/usr/bin/{srpg.py,lostsky}
  sed -i 's/#os/os/g' $pkgdir/usr/bin/lostsky

  mkdir -p $pkgdir/usr/share/{lostsky,doc/lostsky,licenses/lostsky}

  install -D -m644 bsd_license.txt $pkgdir/usr/share/licenses/lostsky
  install -D -m644 *.txt $pkgdir/usr/share/doc/lostsky

  install -D -m755 $srcdir/lostsky.desktop $pkgdir/usr/share/applications/lostsky.desktop
  install -D -m644 $srcdir/lostsky.png $pkgdir/usr/share/icons/lostsky.png
}
