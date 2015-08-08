pkgname=amphetype-svn
pkgver=11.2607402
pkgrel=1
pkgdesc="A layout-agnostic typing program aimed at people who don't need an on-screen keyboard"
arch=("i686" "x86_64")
url="http://code.google.com/p/amphetype/"
license=("GPL3")
depends=('python2' 'python2-pyqt4' 'sqlite3')
provides=("amphetype")
conflicts=("amphetype")
source=(amphetype.desktop amphetype.patch 'git://github.com/adiel-mittmann/amphetype.git')
md5sums=('fa29364a99caa1c68332dc8f65e6df8d'
         'd54433a7a254e1284c93485d48fbbac5'
         'SKIP')

pkgver() {
  cd "$srcdir"/amphetype
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "$srcdir/amphetype"
  patch -fp0 < $srcdir/amphetype.patch
  chmod +x Amphetype.py
}

package() {
  install -d "$pkgdir"/{usr/share/applications,usr/bin,usr/share/amphetype/{,txt/{,wordlists},Widgets}}

  install "$srcdir"/amphetype/*.py "$pkgdir"/usr/share/amphetype
  install "$srcdir"/amphetype/Widgets/* "$pkgdir"/usr/share/amphetype/Widgets

  install "$srcdir"/amphetype/txt/*.txt "$pkgdir"/usr/share/amphetype/txt
  install "$srcdir"/amphetype/txt/wordlists/*.txt "$pkgdir"/usr/share/amphetype/txt/wordlists

  install "$srcdir"/amphetype/*.txt "$pkgdir"/usr/share/amphetype
  install "$srcdir"/amphetype/*.html "$pkgdir"/usr/share/amphetype
  install "$srcdir"/amphetype/*.html "$pkgdir"/usr/share/amphetype

  install "$srcdir"/amphetype.desktop "$pkgdir"/usr/share/applications

  ln -s /usr/share/amphetype/Amphetype.py "$pkgdir"/usr/bin/amphetype
}
