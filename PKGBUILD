#Maintainer: Arnaud Joset <info [AT] agayon [DOT] be>

pkgname=('sat-templates-hg')
_realname=sat_templates
pkgver=0.7.r149.e5ec33c4a8a8
_version=0.7
pkgrel=1
url="https://salut-a-toi.org/"
arch=('any')
depends=('python2')
makedepends=('mercurial')
conflicts=('sat-templates')
provides=('sat-templates')
license=('AGPL3')
source=("hg+https://repos.goffi.org/sat_templates")
md5sums=('SKIP')
options=('!strip')

pkgver() {
  cd "$_realname"
  printf "$_version.r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "$srcdir/$_realname"
  python2 setup.py build
  install -dm755 "$srcdir/fakeinstall/"
  python2 setup.py install --root="$srcdir/fakeinstall/" --prefix=/usr --optimize=1
}

package(){
  pkgdesc="sat-templates is a collection of templates for Salut à Toi, the multi-frontends multi-purposes XMPP client (core). For now, it needs to be accessible in the PYTHONPATH"
  depends=('python2-jinja')
  cd "$pkgdir"
  install -dm755 "usr/lib/python2.7/site-packages/$_realname"
  cd	"$srcdir/fakeinstall/"
  mv -v "usr/lib/python2.7/site-packages/$_realname" "$pkgdir/usr/lib/python2.7/site-packages/"
}
